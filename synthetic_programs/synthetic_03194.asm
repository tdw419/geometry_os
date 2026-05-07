; simple draw program
; initialization
  LDI r12, 0x5FCCA2
  LDI r3, 634
  LDI r4, 1258
  LDI r11, 1972
  LDI r13, 1
  LDI r2, 0xA2291F
  LDI r7, 1059
  LDI r0, 0x62469C
  LDI r1, 3883
  LDI r3, 32
  LDI r15, 2804
  WPIXEL
  LDI r9, 0
  LDI r15, 8
  LDI r7, 8
  LDI r10, 0
  CIRCLE r9, r15, r7, r10
  LDI r4, 4
  LDI r0, 0xE274FE
  LDI r10, 255
  LDI r11, 1696
  LDI r13, 8
  RECTF r4, r0, r10, r11, r13
  HALT
