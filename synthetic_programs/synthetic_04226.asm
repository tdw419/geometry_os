; input driven program
; initialization
  LDI r15, 155
  LDI r0, 191
main_0:
  CMP r9, r15
  ANDI r1, r9, 208
  FRAME
  JMP main_0
