; simple draw program
; initialization
  LDI r17, 0x17B86F
  LDI r9, 1446
  LDI r14, 3210
  LDI r15, 64
  LDI r21, 255
  LDI r8, 4
  LDI r0, 272
  LDI r1, 2560
  LDI r0, 32
  PSETI
  LDI r13, 2
  LDI r3, 0xC98EC9
  LDI r6, 0x80A22F
  LDI r14, 1101
  LDI r2, 0xC5911B
  RECTF r13, r3, r6, r14, r2
  LDI r10, 16
  LDI r11, 257
  LDI r4, 54
  LDI r15, 0xDC1C36
  CIRCLE r10, r11, r4, r15
  HALT
