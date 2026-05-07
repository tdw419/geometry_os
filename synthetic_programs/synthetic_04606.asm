; input driven program
; initialization
  LDI r7, 0xB89907
  LDI r0, 255
  LDI r19, 3076
main_0:
  ANDI r7, r2, 249
  LDI r12, 3422
  LDI r0, 3935
  LDI r0, 3507
  TEXT r12, r0, r0, "HELLO"
  FRAME
  JMP main_0
