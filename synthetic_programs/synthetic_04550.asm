; counted animation
; initialization
  LDI r4, 8
  LDI r2, 0xA92FF5
  LDI r15, 0
loop_0:
  SUBI r11, r9, 0x4130D7
  LDI r8, 1
  SUB r15, r15, r8
  JNZ r15, loop_0
  HALT
