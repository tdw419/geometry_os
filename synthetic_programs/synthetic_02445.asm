; conditional logic
; initialization
  LDI r13, 0xC8B5EB
  LDI r9, 1988
  LDI r3, 2653
  LDI r8, 0x346427
  LDI r12, 0
  LDI r4, 1782
  LDI r5, 0
  LDI r2, 128
  CMP r5, r11
  JNZ r5, else_0
  SHR r6, r13, r7
  JMP endif_1
else_0:
  LDI r13, 32
  FILL r13
  LDI r3, 3359
  LDI r6, 8
  LDI r1, 0
  PSETI
  LDI r10, 1
  LDI r5, 2119
  LDI r11, 255
  PSET r10, r5, r11
endif_1:
  CMP r0, r2
  JNZ r0, else_2
  DIV r6, r14, r15
  JMP endif_3
else_2:
  LDI r1, 0xEFF5B3
  LDI r11, 3975
  LDI r2, 256
  LDI r4, 2418
  CIRCLE r1, r11, r2, r4
endif_3:
  HALT
