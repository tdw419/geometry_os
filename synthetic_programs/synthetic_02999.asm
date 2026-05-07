; conditional logic
; initialization
  LDI r7, 16
  LDI r8, 0x2DD2D1
  CMP r12, r5
  JNZ r12, else_0
  DIV r10, r8, r0
  AND r10, r14, r11
  MUL r4, r6, r10
  OR r4, r15, r2
  JMP endif_1
else_0:
  LDI r9, 2
  LDI r3, 4
  LDI r5, 129
  PSETI
  LDI r9, 0x4E11DF
  LDI r11, 2460
  LDI r13, 3097
  PSET r9, r11, r13
endif_1:
  CMP r0, r7
  JNZ r0, else_2
  MOD r2, r12, r6
  SHR r5, r4, r2
  MOD r9, r12, r10
  OR r6, r10, r9
  JMP endif_3
else_2:
  LDI r12, 0xC7537D
  LDI r3, 0xDC9E73
  LDI r13, 8
  LDI r0, 128
  CIRCLE r12, r3, r13, r0
  LDI r14, 1685
  LDI r11, 0x09A040
  LDI r4, 1893
  LDI r15, 10
  LDI r1, 2
  RECTF r14, r11, r4, r15, r1
endif_3:
  HALT
