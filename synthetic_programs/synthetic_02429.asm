; counted animation
; initialization
  LDI r13, 128
  LDI r6, 0xD0ABBE
  LDI r6, 1
loop_0:
  LDI r9, 0xA8F991
  LDI r6, 0
  LDI r10, 10
  PSET r9, r6, r10
  LDI r14, 2895
  LDI r7, 0x953F26
  LDI r4, 8
  LDI r11, 1332
  CIRCLE r14, r7, r4, r11
  CMPI r15, r13, 125
  LDI r7, 1
  SUB r6, r6, r7
  JNZ r6, loop_0
  HALT
