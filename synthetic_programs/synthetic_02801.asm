; simple draw program
; initialization
  LDI r5, 0xCCEA75
  LDI r8, 2347
  LDI r0, 1649
  LDI r8, 351
  LDI r8, 503
  LDI r11, 2653
  LDI r0, 0xECEF5D
  LDI r6, 128
  LINE r8, r8, r11, r0, r6
  LDI r4, 10
  LDI r10, 2753
  LDI r1, 256
  LDI r11, 2516
  LDI r12, 0xBAE84F
  RECTF r4, r10, r1, r11, r12
  LDI r16, 0xEB8CF9
  LDI r2, 0xA796F8
  LDI r24, 256
  PSET r16, r2, r24
  HALT
