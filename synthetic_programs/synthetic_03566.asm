; mixed program
; initialization
  LDI r14, 2663
  LDI r9, 3408
  LDI r13, 0x1E0F72
  LDI r12, 10
  LDI r2, 1
  LDI r0, 39
  LDI r9, 32
  STORE r9, r10
  LOAD r15, r9
  LDI r4, 1015
  STORE r4, r9
  LOAD r16, r4
  LDI r13, 514
  STORE r13, r14
  LOAD r11, r13
  LDI r6, 0xDD4982
loop_0:
  SHL r4, r1, r12
  LDI r10, 1
  SUB r6, r6, r10
  JNZ r6, loop_0
  LDI r8, 629
  FILL r8
  LDI r7, 0x0A3367
  LDI r2, 3578
  LDI r19, 256
  PSET r7, r2, r19
  DIV r5, r1, r13
  AND r24, r12, r3
  XOR r15, r5, r13
  OR r1, r13, r12
  XOR r11, r4, r3
  LDI r3, 0x426181
  LDI r8, 0
  LDI r2, 2090
  PSET r3, r8, r2
  CMP r15, r13
  JNZ r15, else_1
  ADD r14, r3, r15
  JMP endif_2
else_1:
  LDI r16, 64
  LDI r5, 190
  LDI r5, 896
  LDI r7, 2110
  CIRCLE r16, r5, r5, r7
  LDI r2, 2130
  LDI r15, 0
  LDI r6, 135
  PSET r2, r15, r6
  LDI r6, 0x6676CE
  LDI r10, 758
  LDI r1, 0xC8DC32
  LDI r1, 1583
  CIRCLE r6, r10, r1, r1
  LDI r7, 3746
  LDI r2, 32
  LDI r14, 256
  LDI r5, 0xBF78E6
  LDI r14, 1023
  RECTF r7, r2, r14, r5, r14
endif_2:
main_3:
  ANDI r5, r10, 256
  CMPI r2, 85
  LDI r14, 0x7D00D0
  LDI r15, 16
  LDI r8, 2
  TEXT r14, r15, r8, "HELLO"
  SHL r3, r6, r14
  SHR r11, r9, r14
  SHR r13, r10, r2
  SHL r12, r9, r4
  CMP r5, r7
  FRAME
  JMP main_3
