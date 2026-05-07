; conditional logic
; initialization
  LDI r8, 256
  LDI r6, 0x57B190
  LDI r10, 1074
  LDI r14, 1873
  LDI r0, 0
  LDI r12, 0xCAA8AA
  LDI r2, 128
  LDI r28, 255
  CMP r15, r8
  JZ r15, else_0
  MOD r2, r10, r14
  MOD r5, r12, r15
  XOR r7, r11, r10
  MUL r14, r3, r10
  JMP endif_1
else_0:
  LDI r3, 959
  LDI r5, 2425
  LDI r0, 599
  PSET r3, r5, r0
  LDI r5, 545
  LDI r13, 0x3C4E0E
  LDI r14, 1115
  WPIXEL
  LDI r13, 0xFB2D53
  LDI r20, 1920
  LDI r13, 1229
  PSETI
  LDI r7, 2
  LDI r2, 0xD3366D
  LDI r13, 0x63C47F
  LDI r11, 3879
  CIRCLE r7, r2, r13, r11
endif_1:
  CMP r13, r14
  JZ r13, else_2
  SHR r12, r6, r4
  MUL r6, r0, r14
  SHR r1, r8, r0
  DIV r6, r13, r3
  JMP endif_3
else_2:
  LDI r1, 0xF5B70D
  LDI r7, 1619
  LDI r3, 10
  LDI r15, 183
  LDI r14, 2047
  LINE r1, r7, r3, r15, r14
endif_3:
  HALT
