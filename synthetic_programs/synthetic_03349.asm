; math computation
; initialization
  LDI r15, 255
  LDI r10, 0x621DE3
  LDI r11, 2025
  LDI r0, 1216
  DIV r7, r4, r10
  OR r1, r2, r13
  SHLI r10, r12, 0x03469E
  SHLI r8, r1, 16
  SHL r15, r11, r10
  XOR r5, r1, r13
  SHL r11, r0, r7
  SUBI r13, r2, 256
  MOD r12, r5, r15
  MOD r11, r9, r10
  OR r9, r11, r15
  HALT
