; conditional logic
; initialization
  LDI r13, 0xDB2FFE
  LDI r10, 0xD7827E
  CMP r7, r1
  JZ r7, else_0
  MUL r4, r12, r15
  MOD r0, r10, r15
  JMP endif_1
else_0:
  LDI r8, 0x2B20C2
  LDI r12, 2
  LDI r3, 0x239231
  PSET r8, r12, r3
  LDI r13, 256
  LDI r30, 3049
  LDI r6, 2
  LDI r1, 128
  CIRCLE r13, r30, r6, r1
  LDI r11, 3993
  FILL r11
endif_1:
  HALT
