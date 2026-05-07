; simple draw program
; initialization
  LDI r10, 0x32A676
  LDI r11, 16
  LDI r14, 1830
  LDI r8, 2503
  LDI r10, 1
  WPIXEL
  LDI r5, 1
  FILL r5
  LDI r10, 88
  LDI r5, 0
  LDI r3, 1657
  PSETI
  HALT
