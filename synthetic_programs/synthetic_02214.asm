; conditional logic
; initialization
  LDI r2, 32
  LDI r10, 0xF5678F
  LDI r4, 1424
  LDI r11, 2797
  LDI r14, 0xDD5A0D
  LDI r12, 0xC04EB8
  LDI r0, 2
  LDI r6, 0x7EB4A1
  CMP r8, r0
  JZ r8, else_0
  OR r8, r13, r14
  DIV r12, r8, r14
  JMP endif_1
else_0:
  LDI r6, 0x7E3E8C
  LDI r5, 0x8F5D99
  LDI r0, 2423
  LDI r6, 0xAB2DB7
  LDI r6, 0x61BB80
  RECTF r6, r5, r0, r6, r6
  LDI r9, 3987
  LDI r6, 1112
  LDI r8, 1020
  PSETI
  LDI r11, 2731
  FILL r11
  LDI r1, 2711
  FILL r1
endif_1:
  HALT
