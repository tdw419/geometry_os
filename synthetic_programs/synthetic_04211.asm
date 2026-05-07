; input driven program
; initialization
  LDI r15, 563
  LDI r12, 128
  LDI r4, 128
main_0:
  LDI r11, 624
  LDI r4, 4
  LDI r14, 10
  LDI r13, 128
  LDI r4, 3751
  LINE r11, r4, r14, r13, r4
  LDI r10, 2327
  LDI r5, 0
  LDI r10, 3846
  TEXT r10, r5, r10, "HELLO"
  SHL r16, r13, r4
  FRAME
  JMP main_0
