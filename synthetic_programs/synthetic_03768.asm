; counted animation
; initialization
  LDI r3, 0xBA5A9F
  LDI r15, 1232
  LDI r4, 250
  LDI r11, 2
  LDI r14, 10
loop_0:
  ANDI r22, r4, 0xBFAABE
  SHL r11, r4, r12
  LDI r15, 1
  SUB r14, r14, r15
  JNZ r14, loop_0
  HALT
