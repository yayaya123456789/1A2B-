module final_project(clk,a_in,sw, HEX3, HEX2, HEX1, HEX0,led);
	input clk;
	input [3:0]a_in;//4 bit
	input [5:0] sw;
	//sw[3]~s[0] adjust HEX3~HEX0
	//sw[4] reset
	//SW[5] comfirm
	output reg [0:7]HEX3;
	output reg [0:7]HEX2;
	output reg [0:7]HEX1;
	output reg [0:7]HEX0;
	reg [7:0] num[10];
	
	output reg[9:0] led;
	reg [3:0] i = 4'd0, j = 4'd0;
	wire[0:7]a =8'b00001001;
	wire[0:7]b =8'b00001001;

	
	reg c=0;
	reg c2=1;
	reg [0:7]num_of_a = 8'b0000000;//num_of_a =0;
	reg [0:7]num_of_b = 8'b0000000;//num_of_b =0;
	reg [0:7]num_of_c = 8'b0000000;//num_of_a =0;

	
	//answer=1234
	reg[0:7]answer0 = 8'b10011001;
	reg[0:7]answer1 = 8'b00001101;
	reg[0:7]answer2 = 8'b00100101;
	reg[0:7]answer3 = 8'b10011111;
	

	initial begin
		
		num[0]=8'b00000011;//0
		num[1]=8'b10011111;//1
		num[2]=8'b00100101;//2
		num[3]=8'b00001101;//3
		num[4]=8'b10011001;//4
		num[5]=8'b01001001;//5
		num[6]=8'b01000001;//6
		num[7]=8'b00011011;//7
		num[8]=8'b00000001;//8
		num[9]=8'b00001001;//9
		
		HEX3=8'b00000011;//0
		HEX2=8'b00000011;//0
		HEX1=8'b00000011;//0
		HEX0=8'b00000011;//0
		led=10'b1111111111;
		c<=0;
		c2=1;
	end
	
	always @(posedge clk) begin
		if(c2==1)begin
		if(sw[4]==1)begin //reset
			num[0]=8'b00000011;//0
			num[1]=8'b10011111;//1
			num[2]=8'b00100101;//2
			num[3]=8'b00001101;//3
			num[4]=8'b10011001;//4
			num[5]=8'b01001001;//5
			num[6]=8'b01000001;//6
			num[7]=8'b00011011;//7
			num[8]=8'b00000001;//8
			num[9]=8'b00001001;//9
			c<=0;
			c2=1;
			HEX3=8'b00000011;//0
			HEX2=8'b00000011;//0
			HEX1=8'b00000011;//0
			HEX0=8'b00000011;//0
			i = 4'd0;
			j = 4'd0;
		end
		
		else begin
			if(sw[3]==1) begin
				case(a_in[3:0])
					4'b0000:HEX3=8'b00000011;//0
					4'b0001:HEX3=8'b10011111;//1
					4'b0010:HEX3=8'b00100101;//2
					4'b0011:HEX3=8'b00001101;//3
					4'b0100:HEX3=8'b10011001;//4
					4'b0101:HEX3=8'b01001001;//5
					4'b0110:HEX3=8'b01000001;//6
					4'b0111:HEX3=8'b00011011;//7
					4'b1000:HEX3=8'b00000001;//8
					4'b1001:HEX3=8'b00001001;//9
				endcase
			end
			
			if(sw[2]==1)begin
				case(a_in[3:0])
					4'b0000:HEX2=8'b00000011;//0
					4'b0001:HEX2=8'b10011111;//1
					4'b0010:HEX2=8'b00100101;//2
					4'b0011:HEX2=8'b00001101;//3
					4'b0100:HEX2=8'b10011001;//4
					4'b0101:HEX2=8'b01001001;//5
					4'b0110:HEX2=8'b01000001;//6
					4'b0111:HEX2=8'b00011011;//7
					4'b1000:HEX2=8'b00000001;//8
					4'b1001:HEX2=8'b00001001;//9
					default:HEX2=8'b0000000;
				endcase
			end
			
			if(sw[1]==1)begin
				case(a_in[3:0])
					4'b0000:HEX1=8'b00000011;//0
					4'b0001:HEX1=8'b10011111;//1
					4'b0010:HEX1=8'b00100101;//2
					4'b0011:HEX1=8'b00001101;//3
					4'b0100:HEX1=8'b10011001;//4
					4'b0101:HEX1=8'b01001001;//5
					4'b0110:HEX1=8'b01000001;//6
					4'b0111:HEX1=8'b00011011;//7
					4'b1000:HEX1=8'b00000001;//8
					4'b1001:HEX1=8'b00001001;//9
					default:HEX1=8'b0000000;
				endcase
			end
			
			if(sw[0]==1)begin
				case(a_in[3:0])
					4'b0000:HEX0=8'b00000011;//0
					4'b0001:HEX0=8'b10011111;//1
					4'b0010:HEX0=8'b00100101;//2
					4'b0011:HEX0=8'b00001101;//3
					4'b0100:HEX0=8'b10011001;//4
					4'b0101:HEX0=8'b01001001;//5
					4'b0110:HEX0=8'b01000001;//6
					4'b0111:HEX0=8'b00011011;//7
					4'b1000:HEX0=8'b00000001;//8
					4'b1001:HEX0=8'b00001001;//9
					default:HEX0=8'b0000000;
				endcase
			end
		end
		
				
		if(sw[5]==1 &&  HEX3==answer3 && c==0)begin	//?A
			j = j + 4'd1;
		end
		
		else if(sw[5]==1 && ((HEX3==answer0) || (HEX3==answer1) || (HEX3==answer2))  && c==0 )begin//?B
			i = i + 4'd1;
		end
		
		
		if(sw[5]==1 && HEX2==answer2 && c==0)begin
			j = j + 4'd1;
		end
		
		else if( sw[5]==1 && ((HEX2==answer0) || (HEX2==answer1) || (HEX2==answer3) )&& c==0)begin//?B
			i = i + 4'd1;
		end
		
		
		if(sw[5]==1 && HEX1==answer1 && c==0)begin
			j = j + 4'd1;
		end
		else if(sw[5]==1 &&  ((HEX1==answer0) || (HEX1==answer2) || (HEX1==answer3) )&& c==0)begin//?B
			i = i + 4'd1;
		end
		
		
		if(sw[5]==1 && HEX0==answer0 && c==0)begin
			j = j + 4'd1;
		end
		
		else if(sw[5]==1 && ((HEX0==answer1) || (HEX0==answer2) || (HEX0==answer3)) && c==0)begin//?B
			i = i + 4'd1;
		end
		
		
		if(sw[5]==1 &&  c==0)begin//?B
			//num_of_c<=8'b01001001;
			HEX3 = num[j];
			//HEX3<= num_of_a;
			HEX2<= 8'b00010001;//print A
			HEX1= num[i];
			HEX0<= 8'b00000001;//print B
			c<=1;
			//c2=0;
			end
		end
		
	end
	
endmodule


