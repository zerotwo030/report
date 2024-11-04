`timescale 10ps/1ps

module tb_SRAM();

reg clk;
reg DVSE;
reg [3:0] DVS;
reg WEAN;
reg WEBN;
reg CSAN;
reg CSBN;
reg NAP;
reg [12:0] A;
reg [12:0] B;
reg [31:0] DIA;
reg [31:0] DIB;
wire [31:0] DOA;
wire [31:0] DOB;

initial begin  
    clk = 1'b0;  
    forever #200 clk = ~clk; // 4ns时钟周期  
end


initial begin
    // 初始化
    A = 13'd1;   
    B = 13'd1;   
    DVSE = 0;  
    DVS = 4'd0;  
    WEAN = 1; // 写使能关闭  
    WEBN = 1; // 写使能关闭  
    CSAN = 0; 
    CSBN = 0; 
    NAP = 0;  
    DIA = 32'h00000000;  
    DIB = 32'h00000000;

    #2000; // 等待20ns(5个时钟),确保系统稳定  

    // Test1:执行A口写数据，B口读数据  
    DIA = 32'h11111111; // 要写入的数据  
    DIB = 32'h11110000; // 要写入的数据  
    WEAN = 0; 

    #4000;// 等待40ns(10个时钟)，复位执行下一个test

    A = 13'd1;   
    B = 13'd1;   
    DVSE = 0;  
    DVS = 4'd0;  
    WEAN = 1; // 写使能关闭  
    WEBN = 1; // 写使能关闭  
    CSAN = 0; 
    CSBN = 0; 
    NAP = 0;  
    DIA = 32'h00000000;  
    DIB = 32'h00000000;

    #2000; // 等待20ns(5个时钟),确保系统稳定  

    // Test2:执行A口写数据，A口读数据，B口再读数据
    DIA = 32'h11111111; // 要写入的数据  
    DIB = 32'h11110000; // 要写入的数据 
    WEAN = 0; 
    #400;
    WEAN = 1;
    WEBN = 1;


end
    //IP核实例化
    SJLA40_8192X32X1CM8 my_SJLA40_8192X32X1CM8(
    .CKA(clk), .CKB(clk), .DVSE(DVSE), .DVS0(DVS[0]), .DVS1(DVS[1]), .DVS2(DVS[2]), .DVS3(DVS[3]),
    .WEAN(WEAN), .WEBN(WEBN), .CSAN(CSAN), .CSBN(CSBN), .NAP(NAP),

    .A0(A[0]), .A1(A[1]), .A2(A[2]), .A3(A[3]), .A4(A[4]), .A5(A[5]), .A6(A[6]),
    .A7(A[7]), .A8(A[8]), .A9(A[9]), .A10(A[10]), .A11(A[11]), .A12(A[12]),

    .B0(B[0]), .B1(B[1]), .B2(B[2]), .B3(B[3]), .B4(B[4]), .B5(B[5]), .B6(B[6]),
    .B7(B[7]), .B8(B[8]), .B9(B[9]), .B10(B[10]), .B11(B[11]), .B12(B[12]),

    .DIA0(DIA[0]), .DIA1(DIA[1]), .DIA2(DIA[2]), .DIA3(DIA[3]), .DIA4(DIA[4]), .DIA5(DIA[5]), 
    .DIA6(DIA[6]), .DIA7(DIA[7]), .DIA8(DIA[8]), .DIA9(DIA[9]), .DIA10(DIA[10]), .DIA11(DIA[11]),
    .DIA12(DIA[12]), .DIA13(DIA[13]), .DIA14(DIA[14]), .DIA15(DIA[15]), .DIA16(DIA[16]), .DIA17(DIA[17]),  
    .DIA18(DIA[18]), .DIA19(DIA[19]), .DIA20(DIA[20]), .DIA21(DIA[21]), .DIA22(DIA[22]), .DIA23(DIA[23]),  
    .DIA24(DIA[24]), .DIA25(DIA[25]), .DIA26(DIA[26]), .DIA27(DIA[27]), .DIA28(DIA[28]), .DIA29(DIA[29]),  
    .DIA30(DIA[30]), .DIA31(DIA[31]),

    .DIB0(DIB[0]), .DIB1(DIB[1]), .DIB2(DIB[2]), .DIB3(DIB[3]), .DIB4(DIB[4]), .DIB5(DIB[5]),
    .DIB6(DIB[6]), .DIB7(DIB[7]), .DIB8(DIB[8]), .DIB9(DIB[9]), .DIB10(DIB[10]), .DIB11(DIB[11]), 
    .DIB12(DIB[12]), .DIB13(DIB[13]), .DIB14(DIB[14]), .DIB15(DIB[15]), .DIB16(DIB[16]), .DIB17(DIB[17]), 
    .DIB18(DIB[18]), .DIB19(DIB[19]), .DIB20(DIB[20]), .DIB21(DIB[21]), .DIB22(DIB[22]), .DIB23(DIB[23]),
    .DIB24(DIB[24]), .DIB25(DIB[25]), .DIB26(DIB[26]), .DIB27(DIB[27]), .DIB28(DIB[28]), .DIB29(DIB[29]),
    .DIB30(DIB[30]), .DIB31(DIB[31]), 

    .DOA0(DOA[0]), .DOA1(DOA[1]), .DOA2(DOA[2]), .DOA3(DOA[3]), .DOA4(DOA[4]), .DOA5(DOA[5]), 
    .DOA6(DOA[6]), .DOA7(DOA[7]), .DOA8(DOA[8]), .DOA9(DOA[9]), .DOA10(DOA[10]), .DOA11(DOA[11]),
    .DOA12(DOA[12]), .DOA13(DOA[13]), .DOA14(DOA[14]), .DOA15(DOA[15]), .DOA16(DOA[16]), .DOA17(DOA[17]), 
    .DOA18(DOA[18]), .DOA19(DOA[19]), .DOA20(DOA[20]), .DOA21(DOA[21]), .DOA22(DOA[22]), .DOA23(DOA[23]),
    .DOA24(DOA[24]), .DOA25(DOA[25]), .DOA26(DOA[26]), .DOA27(DOA[27]), .DOA28(DOA[28]), .DOA29(DOA[29]), 
    .DOA30(DOA[30]), .DOA31(DOA[31]),  
  
    .DOB0(DOB[0]), .DOB1(DOB[1]), .DOB2(DOB[2]), .DOB3(DOB[3]), .DOB4(DOB[4]), .DOB5(DOB[5]), 
    .DOB6(DOB[6]), .DOB7(DOB[7]), .DOB8(DOB[8]), .DOB9(DOB[9]), .DOB10(DOB[10]), .DOB11(DOB[11]), 
    .DOB12(DOB[12]), .DOB13(DOB[13]), .DOB14(DOB[14]), .DOB15(DOB[15]), .DOB16(DOB[16]), .DOB17(DOB[17]), 
    .DOB18(DOB[18]), .DOB19(DOB[19]), .DOB20(DOB[20]), .DOB21(DOB[21]), .DOB22(DOB[22]), .DOB23(DOB[23]), 
    .DOB24(DOB[24]), .DOB25(DOB[25]), .DOB26(DOB[26]), .DOB27(DOB[27]), .DOB28(DOB[28]), .DOB29(DOB[29]), 
    .DOB30(DOB[30]), .DOB31(DOB[31])
                           
    );

endmodule

