; counted animation
; initialization
  LDI r6, 3717
  LDI r4, 10
  LDI r13, 0x77AD69
  LDI r10, 1380
  LDI r0, 244
  LDI r14, 0x8D27CE
  LDI r9, 0xE95336
  LDI r11, 0
loop_0:
  SUBI r0, r13, 8
  CMPI r2, r10, 0x134A2C
  LDI r4, 1
  SUB r11, r11, r4
  JNZ r11, loop_0
  HALT
