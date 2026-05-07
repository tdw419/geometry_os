; simple draw program
; initialization
  LDI r14, 718
  LDI r3, 1591
  LDI r2, 256
  LDI r8, 0x15FC42
  LDI r9, 3093
  LDI r15, 1
  LDI r10, 0x437B39
  LDI r5, 0x25A019
  LDI r12, 1
  LDI r8, 0x1302C2
  CIRCLE r10, r5, r12, r8
  LDI r11, 255
  LDI r6, 0xFD3010
  LDI r11, 8
  WPIXEL
  LDI r7, 256
  LDI r15, 1
  LDI r11, 128
  PSETI
  HALT
