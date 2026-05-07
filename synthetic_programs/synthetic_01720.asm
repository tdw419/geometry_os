; counted animation
; initialization
  LDI r4, 0xD6E894
  LDI r5, 691
  LDI r14, 2668
  LDI r9, 16
  LDI r15, 256
  LDI r2, 0x3B1CAF
loop_0:
  LDI r3, 16
  LDI r5, 3261
  LDI r9, 256
  LDI r30, 0xC3FC50
  LDI r4, 775
  LINE r3, r5, r9, r30, r4
  LDI r13, 1
  SUB r2, r2, r13
  JNZ r2, loop_0
  HALT
