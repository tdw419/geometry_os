; conditional logic
; initialization
  LDI r10, 1225
  LDI r5, 256
  CMP r13, r9
  JZ r13, else_0
  XOR r12, r3, r6
  SUB r5, r12, r3
  AND r0, r1, r9
  DIV r1, r12, r10
  JMP endif_1
else_0:
  LDI r15, 32
  FILL r15
  LDI r9, 0x255B29
  LDI r14, 64
  LDI r12, 0x99CCA9
  LDI r12, 0x8ACEC6
  LDI r9, 2174
  RECTF r9, r14, r12, r12, r9
endif_1:
  CMP r2, r15
  JZ r2, else_2
  MUL r1, r5, r8
  XOR r0, r7, r2
  JMP endif_3
else_2:
  LDI r9, 0x3F7009
  LDI r9, 16
  LDI r12, 2
  PSET r9, r9, r12
  LDI r7, 2274
  LDI r1, 631
  LDI r3, 0x4F268A
  LDI r8, 2
  LDI r18, 2210
  LINE r7, r1, r3, r8, r18
  LDI r9, 0x295297
  LDI r3, 2431
  LDI r7, 3678
  LDI r1, 0xD29393
  LDI r7, 3896
  RECTF r9, r3, r7, r1, r7
  LDI r0, 0x13A45B
  FILL r0
endif_3:
  HALT
