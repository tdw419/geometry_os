; counted animation
; initialization
  LDI r31, 32
  LDI r10, 911
  LDI r13, 2
  LDI r1, 8
  LDI r13, 37
loop_0:
  ANDI r13, r9, 0x578E6C
  LDI r11, 1
  SUB r13, r13, r11
  JNZ r13, loop_0
  HALT
