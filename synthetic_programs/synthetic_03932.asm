; conditional logic
; initialization
  LDI r17, 693
  LDI r8, 1404
  LDI r15, 1419
  CMP r6, r29
  JNZ r6, else_0
  AND r10, r0, r6
  MOD r6, r7, r9
  DIV r3, r2, r12
  MOD r0, r2, r3
  JMP endif_1
else_0:
  LDI r8, 4
  LDI r12, 2375
  LDI r11, 0x7DED1F
  PSET r8, r12, r11
  LDI r9, 1994
  LDI r3, 0xBB0C4E
  LDI r10, 2279
  WPIXEL
endif_1:
  HALT
