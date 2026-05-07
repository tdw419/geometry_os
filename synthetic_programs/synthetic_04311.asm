; simple draw program
; initialization
  LDI r14, 0xF8EFC3
  LDI r3, 255
  LDI r29, 16
  LDI r8, 0x9825F1
  LDI r15, 2350
  LDI r13, 64
  LDI r3, 64
  LDI r13, 128
  LDI r5, 16
  RECTF r15, r13, r3, r13, r5
  LDI r11, 256
  LDI r3, 10
  LDI r8, 10
  LDI r13, 3495
  LDI r13, 3078
  RECTF r11, r3, r8, r13, r13
  HALT
