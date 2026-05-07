; input driven program
; initialization
  LDI r3, 128
  LDI r13, 1
  LDI r30, 4
main_0:
  SUBI r12, r7, 225
  LDI r11, 1
  FILL r11
  LDI r10, 243
  LDI r8, 3021
  LDI r9, 2434
  TEXT r10, r8, r9, "HELLO"
  FRAME
  JMP main_0
