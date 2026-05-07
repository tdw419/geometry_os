; mixed program
; initialization
  LDI r7, 0x8EAEAC
  LDI r10, 256
  LDI r15, 0xAFF2FB
  LDI r4, 0x9FC03E
  LDI r11, 256
  LDI r12, 2
  LDI r13, 3389
  CALL func_0
func_0:
  MOD r4, r12, r0
  XOR r11, r9, r3
  ADD r13, r7, r12
  MUL r11, r9, r2
  RET
  CMPI r8, 32
  LDI r12, 64
loop_1:
  SUBI r14, r9, 255
  ADDI r0, r14, 2
  ANDI r9, r6, 54
  LDI r5, 1
  SUB r12, r12, r5
  JNZ r12, loop_1
  LDI r13, 16
  LDI r1, 2651
  LDI r11, 10
  DRAWTEXT r13, r1, r11, "WORLD"
  CALL func_2
func_2:
  DIV r15, r7, r8
  MUL r4, r0, r5
  ADD r13, r3, r12
  XOR r7, r8, r11
  OR r8, r4, r6
  DIV r2, r0, r15
  RET
  CMP r3, r5
  JNZ r3, else_3
  SHL r5, r10, r7
  MUL r1, r13, r15
  JMP endif_4
else_3:
  LDI r11, 648
  LDI r2, 2795
  LDI r1, 3284
  WPIXEL
  LDI r12, 1484
  LDI r10, 4020
  LDI r9, 2
  WPIXEL
  LDI r2, 593
  LDI r9, 1962
  LDI r9, 0xA1948D
  LDI r10, 0x370863
  LDI r6, 256
  RECTF r2, r9, r9, r10, r6
endif_4:
  SAR r14, r24, r11
  SHLI r3, r11, 255
  SHLI r15, r13, 0
main_5:
  ADDI r2, r9, 0xD8E9ED
  LDI r6, 1
  LDI r3, 0x2E583D
  LDI r28, 3846
  DRAWTEXT r6, r3, r28, "WORLD"
  LDI r9, 32
  LDI r8, 3042
  LDI r2, 0xF54449
  DRAWTEXT r9, r8, r2, "WORLD"
  SAR r14, r2, r13
  SHLI r12, r9, 2
  FRAME
  JMP main_5
