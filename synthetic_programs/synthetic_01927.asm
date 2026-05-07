; simple draw program
; initialization
  LDI r3, 0x245EE7
  LDI r5, 2840
  LDI r12, 0xF64196
  LDI r0, 128
  LDI r2, 64
  LDI r4, 4
  LDI r7, 1050
  LDI r10, 255
  CIRCLE r2, r4, r7, r10
  LDI r10, 3866
  LDI r9, 255
  LDI r11, 1953
  PSET r10, r9, r11
  LDI r4, 1234
  FILL r4
  HALT
