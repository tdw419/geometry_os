; counted animation
; initialization
  LDI r14, 748
  LDI r8, 0x3648AE
  LDI r2, 128
  LDI r4, 8
  LDI r0, 1343
  LDI r3, 0x98AC21
  LDI r15, 256
  LDI r9, 8
loop_0:
  SUB r13, r3, r9
  LDI r11, 1
  SUB r9, r9, r11
  JNZ r9, loop_0
  HALT
