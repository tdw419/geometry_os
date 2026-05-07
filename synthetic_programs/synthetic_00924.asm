; simple draw program
; initialization
  LDI r1, 0xE4F01B
  LDI r11, 10
  LDI r7, 1982
  LDI r4, 64
  LDI r12, 1916
  LDI r10, 0x026CB5
  LDI r7, 0x6BCD8E
  LDI r22, 908
  RECTF r4, r12, r10, r7, r22
  LDI r3, 781
  LDI r15, 32
  LDI r11, 8
  LDI r12, 0xF22D21
  LDI r10, 256
  LINE r3, r15, r11, r12, r10
  LDI r6, 0x311DDC
  LDI r13, 548
  LDI r4, 2587
  PSET r6, r13, r4
  HALT
