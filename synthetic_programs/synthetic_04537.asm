; conditional logic
; initialization
  LDI r15, 0xC85BDE
  LDI r5, 1651
  LDI r6, 2
  LDI r26, 0x7626E6
  LDI r4, 64
  LDI r3, 0x99CDFA
  LDI r9, 2004
  LDI r11, 16
  CMP r21, r5
  JZ r21, else_0
  MUL r13, r15, r8
  DIV r10, r8, r12
  JMP endif_1
else_0:
  LDI r1, 2967
  FILL r1
  LDI r5, 255
  LDI r0, 8
  LDI r15, 10
  LDI r7, 0x0A0A5F
  CIRCLE r5, r0, r15, r7
  LDI r1, 3539
  FILL r1
  LDI r26, 447
  LDI r4, 1868
  LDI r8, 303
  LDI r4, 128
  LDI r13, 930
  RECTF r26, r4, r8, r4, r13
endif_1:
  HALT
