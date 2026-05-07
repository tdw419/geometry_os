; mixed program
; initialization
  LDI r0, 0x203170
  LDI r2, 64
; palette
  LDI r9, 0x80D1
  LDI r7, 1
  LDI r15, 0x0044FF
  STORE r9, r15
  ADD r9, r9, r7
  LDI r15, 0xFFEE00
  STORE r9, r15
  ADD r9, r9, r7
  LDI r15, 0x00FF00
  STORE r9, r15
  ADD r9, r9, r7
  LDI r15, 0xDD0044
  STORE r9, r15
  ADD r9, r9, r7
  LDI r15, 0x0044FF
  STORE r9, r15
  ADD r9, r9, r7
  LDI r15, 0x8800FF
  STORE r9, r15
  ADD r9, r9, r7
  LDI r15, 0x00FFAA
  STORE r9, r15
  ADD r9, r9, r7
  LDI r15, 0xFF8800
  STORE r9, r15
  ADD r9, r9, r7
  LDI r15, 0x00AAFF
  STORE r9, r15
  ADD r9, r9, r7
  LDI r15, 0x00FF00
  STORE r9, r15
  ADD r9, r9, r7
  LDI r15, 0x0044FF
  STORE r9, r15
  ADD r9, r9, r7
  LDI r3, 0x8BDAF7
loop_0:
  SUBI r10, r9, 128
  MUL r7, r3, r5
  ADD r0, r10, r13
  LDI r9, 1
  SUB r3, r3, r9
  JNZ r3, loop_0
  MUL r3, r14, r7
  PUSH r9
  PUSH r11
  PUSH r5
  PUSH r28
  DIV r1, r10, r13
  XOR r5, r4, r13
  DIV r15, r5, r0
  SHR r4, r6, r8
  POP r28
  POP r5
  POP r11
  POP r9
  LDI r4, 0xB53842
  STORE r4, r11
  LOAD r5, r4
  LDI r1, 0x0A7C78
  STORE r1, r2
  LOAD r8, r1
  LDI r0, 4
  STORE r0, r9
  LOAD r19, r0
  LDI r12, 0x1361A9
  STORE r12, r24
  LOAD r6, r12
  LDI r15, 3331
  STORE r15, r8
  LOAD r4, r15
  CMP r8, r14
  JZ r8, else_1
  DIV r10, r6, r0
  DIV r3, r9, r11
  JMP endif_2
else_1:
  LDI r14, 0xA6EBB8
  LDI r15, 350
  LDI r14, 0x3E47CD
  LDI r28, 0x2BCAB4
  LDI r12, 0
  LINE r14, r15, r14, r28, r12
  LDI r11, 0x96F39C
  LDI r2, 3160
  LDI r4, 8
  WPIXEL
  LDI r1, 1693
  LDI r13, 2305
  LDI r11, 1097
  LDI r14, 2
  LDI r5, 0x2A6D65
  RECTF r1, r13, r11, r14, r5
  LDI r16, 16
  LDI r0, 260
  LDI r10, 1829
  PSETI
endif_2:
  CALL func_3
func_3:
  XOR r15, r14, r7
  SUB r10, r0, r28
  RET
  HALT
