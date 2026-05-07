; conditional logic
; initialization
  LDI r7, 0xFDA3D8
  LDI r0, 10
  LDI r1, 0x426C76
  LDI r11, 0x670E7D
  CMP r15, r10
  JNZ r15, else_0
  XOR r9, r3, r15
  JMP endif_1
else_0:
  LDI r8, 0xC64DE1
  LDI r5, 172
  LDI r5, 3652
  PSETI
  LDI r15, 3023
  LDI r27, 0x05F241
  LDI r13, 0xB3D1A3
  LDI r7, 1089
  LDI r7, 0xD295AE
  RECTF r15, r27, r13, r7, r7
endif_1:
  CMP r2, r3
  JZ r2, else_2
  XOR r13, r2, r9
  AND r1, r4, r2
  DIV r15, r1, r7
  JMP endif_3
else_2:
  LDI r28, 2649
  LDI r15, 3465
  LDI r1, 1859
  WPIXEL
  LDI r9, 4
  LDI r0, 3757
  LDI r5, 64
  PSET r9, r0, r5
  LDI r9, 822
  LDI r13, 16
  LDI r6, 0xABE225
  PSET r9, r13, r6
endif_3:
  HALT
