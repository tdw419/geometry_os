; input driven program
; initialization
  LDI r8, 0x7E3137
  LDI r13, 1542
  LDI r5, 8
  LDI r14, 0x24069F
  LDI r15, 3094
  LDI r2, 255
  LDI r11, 128
main_0:
  AND r1, r3, r0
  AND r6, r10, r13
  AND r11, r9, r13
  LDI r9, 3235
  LDI r2, 10
  LDI r10, 1064
  WPIXEL
  FRAME
  JMP main_0
