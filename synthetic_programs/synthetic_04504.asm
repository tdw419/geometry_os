; simple draw program
; initialization
  LDI r2, 128
  LDI r0, 0x80B4D9
  LDI r6, 314
  LDI r0, 0xCF7CEF
  LDI r9, 8
  LDI r2, 10
  LDI r9, 0xA6B625
  LDI r6, 1172
  LINE r0, r9, r2, r9, r6
  LDI r8, 4036
  LDI r12, 3384
  LDI r2, 0xF976AE
  WPIXEL
  HALT
