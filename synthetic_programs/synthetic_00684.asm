; input driven program
; initialization
  LDI r12, 1
  LDI r15, 0xF13F18
main_0:
  SUBI r4, r2, 0xC521C8
  LDI r14, 16
  LDI r11, 255
  LDI r7, 32
  TEXT r14, r11, r7, "HELLO"
  FRAME
  JMP main_0
