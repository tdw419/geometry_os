; input driven program
; initialization
  LDI r6, 1740
  LDI r1, 256
  LDI r11, 2
  LDI r9, 64
  LDI r15, 256
main_0:
  LDI r10, 3388
  FILL r10
  LDI r3, 8
  LDI r4, 64
  LDI r13, 255
  TEXT r3, r4, r13, "HELLO"
  FRAME
  JMP main_0
