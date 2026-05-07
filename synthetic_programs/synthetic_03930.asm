; conditional logic
; initialization
  LDI r14, 1171
  LDI r3, 0x400D13
  LDI r10, 128
  LDI r1, 128
  LDI r5, 0xA09395
  LDI r6, 1255
  CMP r2, r10
  JZ r2, else_0
  DIV r3, r10, r14
  MUL r13, r7, r8
  XOR r15, r10, r5
  MUL r13, r11, r5
  JMP endif_1
else_0:
  LDI r12, 2052
  LDI r0, 16
  LDI r0, 2
  LDI r8, 0xC5F93B
  CIRCLE r12, r0, r0, r8
endif_1:
  HALT
