; simple draw program
; initialization
  LDI r15, 637
  LDI r11, 10
  LDI r7, 64
  LDI r1, 256
  LDI r3, 8
  LDI r0, 0x9988F2
  LDI r6, 0x03C3D9
  LDI r4, 1220
  LDI r17, 2
  LDI r3, 0xA649D1
  LDI r11, 3442
  RECTF r6, r4, r17, r3, r11
  LDI r4, 527
  LDI r8, 256
  LDI r1, 64
  WPIXEL
  HALT
