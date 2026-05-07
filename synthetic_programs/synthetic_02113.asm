; conditional logic
; initialization
  LDI r11, 4071
  LDI r12, 256
  LDI r1, 0xB9E3AB
  LDI r8, 0x359246
  CMP r6, r30
  JZ r6, else_0
  XOR r11, r1, r6
  OR r11, r9, r7
  MUL r11, r12, r10
  DIV r7, r31, r1
  JMP endif_1
else_0:
  LDI r12, 64
  LDI r5, 68
  LDI r3, 0x56590C
  LDI r8, 387
  LDI r13, 128
  RECTF r12, r5, r3, r8, r13
  LDI r7, 0x890C07
  FILL r7
  LDI r13, 255
  LDI r0, 0xDF8028
  LDI r13, 2001
  PSET r13, r0, r13
endif_1:
  HALT
