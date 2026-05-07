; conditional logic
; initialization
  LDI r9, 0xF27691
  LDI r14, 32
  LDI r0, 256
  LDI r2, 0x0F8121
  LDI r7, 2694
  LDI r1, 1505
  LDI r3, 0xB25DCF
  CMP r7, r13
  JNZ r7, else_0
  DIV r5, r13, r2
  SHL r5, r1, r12
  JMP endif_1
else_0:
  LDI r8, 1
  LDI r2, 7
  LDI r14, 0x5121DF
  LDI r6, 64
  LDI r10, 32
  LINE r8, r2, r14, r6, r10
  LDI r13, 4
  LDI r4, 16
  LDI r13, 255
  LDI r2, 128
  LDI r1, 2390
  LINE r13, r4, r13, r2, r1
  LDI r8, 3401
  FILL r8
  LDI r7, 10
  LDI r2, 2896
  LDI r15, 2967
  LDI r8, 3391
  CIRCLE r7, r2, r15, r8
endif_1:
  HALT
