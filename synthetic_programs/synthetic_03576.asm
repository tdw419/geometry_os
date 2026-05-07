; conditional logic
; initialization
  LDI r14, 0
  LDI r9, 0xDFA536
  LDI r1, 0x773B60
  LDI r12, 0x0B2BCD
  LDI r2, 966
  CMP r3, r2
  JNZ r3, else_0
  OR r4, r13, r8
  MOD r4, r8, r14
  MUL r8, r11, r10
  AND r6, r12, r5
  JMP endif_1
else_0:
  LDI r1, 0x2832EF
  LDI r0, 1906
  LDI r0, 1916
  WPIXEL
  LDI r1, 255
  LDI r12, 1548
  LDI r13, 0x632E55
  LDI r14, 256
  LDI r7, 0xE44E6C
  RECTF r1, r12, r13, r14, r7
  LDI r31, 0x7E1108
  FILL r31
  LDI r1, 760
  LDI r15, 0x961E25
  LDI r13, 2289
  WPIXEL
endif_1:
  CMP r4, r0
  JZ r4, else_2
  AND r15, r0, r7
  MUL r9, r3, r26
  DIV r14, r2, r6
  AND r0, r14, r7
  JMP endif_3
else_2:
  LDI r4, 0
  LDI r15, 2
  LDI r4, 0x33ECAF
  PSET r4, r15, r4
endif_3:
  HALT
