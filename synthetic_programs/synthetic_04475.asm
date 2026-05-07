; conditional logic
; initialization
  LDI r10, 0
  LDI r2, 1477
  LDI r8, 2173
  LDI r4, 3660
  LDI r3, 0x06D19E
  LDI r11, 64
  CMP r10, r13
  JZ r10, else_0
  XOR r11, r12, r17
  DIV r13, r5, r17
  SUB r13, r9, r15
  MOD r3, r12, r10
  JMP endif_1
else_0:
  LDI r6, 32
  LDI r12, 458
  LDI r12, 231
  LDI r6, 128
  LDI r2, 0xB68836
  RECTF r6, r12, r12, r6, r2
  LDI r14, 8
  LDI r2, 8
  LDI r5, 0x604D78
  PSET r14, r2, r5
endif_1:
  CMP r9, r12
  JNZ r9, else_2
  SUB r7, r5, r2
  AND r11, r12, r0
  JMP endif_3
else_2:
  LDI r3, 2513
  LDI r14, 2
  LDI r5, 16
  PSET r3, r14, r5
  LDI r2, 10
  FILL r2
  LDI r7, 1236
  LDI r30, 256
  LDI r14, 1306
  WPIXEL
endif_3:
  CMP r11, r9
  JNZ r11, else_4
  DIV r12, r7, r9
  AND r3, r8, r0
  JMP endif_5
else_4:
  LDI r2, 0x1CBADF
  LDI r3, 1070
  LDI r9, 0x019158
  PSET r2, r3, r9
  LDI r0, 3895
  LDI r9, 2806
  LDI r8, 0xDD94A3
  PSETI
endif_5:
  HALT
