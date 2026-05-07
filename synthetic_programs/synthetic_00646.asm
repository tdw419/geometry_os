; simple draw program
; initialization
  LDI r7, 0x4A23C4
  LDI r12, 4
  LDI r3, 128
  LDI r10, 64
  LDI r0, 0x0A1008
  LDI r5, 0x22F74F
  LDI r6, 0x07F132
  RECTF r3, r10, r0, r5, r6
  LDI r11, 0x7A0FAC
  FILL r11
  HALT
