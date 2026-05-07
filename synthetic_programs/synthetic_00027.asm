; conditional logic
; initialization
  LDI r6, 3897
  LDI r11, 1483
  LDI r15, 0x846E03
  LDI r5, 731
  LDI r7, 10
  LDI r9, 0
  LDI r2, 1
  CMP r9, r4
  JZ r9, else_0
  SHL r14, r5, r15
  SHL r5, r1, r8
  JMP endif_1
else_0:
  LDI r5, 721
  LDI r13, 32
  LDI r1, 115
  WPIXEL
  LDI r6, 0x021C84
  LDI r7, 0xB04E9D
  LDI r3, 1368
  PSET r6, r7, r3
endif_1:
  CMP r1, r9
  JZ r1, else_2
  SHR r4, r15, r6
  MUL r12, r7, r4
  DIV r5, r1, r8
  JMP endif_3
else_2:
  LDI r19, 256
  LDI r14, 3886
  LDI r6, 2466
  LDI r3, 128
  LDI r13, 256
  LINE r19, r14, r6, r3, r13
endif_3:
  CMP r9, r3
  JZ r9, else_4
  MOD r6, r13, r1
  OR r6, r15, r0
  JMP endif_5
else_4:
  LDI r3, 1221
  LDI r2, 8
  LDI r14, 32
  PSETI
endif_5:
  HALT
