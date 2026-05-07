; simple draw program
; initialization
  LDI r27, 1859
  LDI r2, 0xDBA958
  LDI r0, 0xDC7286
  LDI r11, 931
  LDI r8, 3972
  LDI r1, 10
  LDI r9, 0
  CIRCLE r11, r8, r1, r9
  LDI r0, 64
  LDI r29, 0x287C63
  LDI r7, 0x11A0E9
  LDI r14, 0x24D8D0
  LDI r1, 8
  RECTF r0, r29, r7, r14, r1
  HALT
