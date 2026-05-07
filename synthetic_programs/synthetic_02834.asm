; simple draw program
; initialization
  LDI r9, 3255
  LDI r10, 1849
  LDI r7, 1849
  LDI r14, 0
  LDI r13, 0xBC0D6D
  LDI r15, 2946
  LDI r12, 2198
  LDI r6, 0x665F82
  CIRCLE r13, r15, r12, r6
  LDI r11, 1
  FILL r11
  LDI r13, 3254
  LDI r11, 0x6AD120
  LDI r8, 2901
  LDI r10, 8
  LDI r6, 4
  RECTF r13, r11, r8, r10, r6
  HALT
