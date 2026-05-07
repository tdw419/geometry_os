; conditional logic
; initialization
  LDI r15, 255
  LDI r13, 2031
  LDI r9, 1
  LDI r10, 256
  LDI r8, 928
  LDI r2, 2
  LDI r7, 258
  CMP r7, r0
  JNZ r7, else_0
  XOR r10, r12, r3
  AND r0, r14, r10
  OR r14, r7, r10
  ADD r0, r11, r1
  JMP endif_1
else_0:
  LDI r3, 0x60E392
  LDI r14, 543
  LDI r12, 0x276746
  LDI r3, 32
  CIRCLE r3, r14, r12, r3
  LDI r3, 0x0D1408
  LDI r14, 128
  LDI r24, 128
  WPIXEL
endif_1:
  CMP r4, r9
  JZ r4, else_2
  MUL r5, r8, r4
  DIV r5, r10, r14
  AND r0, r15, r3
  SHL r6, r13, r26
  JMP endif_3
else_2:
  LDI r5, 0
  LDI r5, 256
  LDI r16, 256
  WPIXEL
  LDI r9, 256
  LDI r14, 3899
  LDI r2, 10
  LDI r5, 3716
  LDI r3, 0x67DBFA
  RECTF r9, r14, r2, r5, r3
endif_3:
  HALT
