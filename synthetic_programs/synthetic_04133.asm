; simple draw program
; initialization
  LDI r14, 128
  LDI r19, 4005
  LDI r11, 1523
  LDI r0, 2017
  LDI r7, 0x30781F
  PSETI
  LDI r2, 32
  LDI r14, 0x383FDD
  LDI r5, 16
  LDI r6, 0x84747B
  LDI r14, 16
  RECTF r2, r14, r5, r6, r14
  LDI r1, 16
  LDI r4, 2
  LDI r5, 715
  WPIXEL
  HALT
