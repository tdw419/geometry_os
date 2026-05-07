; simple draw program
; initialization
  LDI r11, 2
  LDI r10, 10
  LDI r3, 4
  LDI r1, 2812
  LDI r11, 255
  LDI r13, 1645
  LDI r15, 128
  LDI r11, 0x3F4873
  RECTF r1, r11, r13, r15, r11
  LDI r4, 0xE2930B
  LDI r5, 0xC3823C
  LDI r5, 64
  LDI r2, 719
  LDI r15, 16
  RECTF r4, r5, r5, r2, r15
  LDI r12, 2
  LDI r8, 0xE16CEE
  LDI r7, 0x6C6885
  WPIXEL
  HALT
