; math computation
; initialization
  LDI r2, 0x86106F
  LDI r13, 0x8FA854
  LDI r15, 16
  LDI r12, 0
  XOR r0, r11, r2
  OR r6, r9, r2
  OR r15, r0, r14
  AND r0, r1, r3
  DIV r15, r3, r6
  SUBI r11, r13, 254
  MOD r10, r13, r2
  SHLI r9, r0, 0xFD4F45
  SAR r11, r12, r6
  SHLI r11, r6, 5
  SHLI r10, r6, 0
  SHR r11, r4, r0
  MOD r2, r4, r10
  OR r8, r11, r3
  AND r12, r4, r15
  HALT
