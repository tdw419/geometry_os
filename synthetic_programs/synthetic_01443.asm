; input driven program
; initialization
  LDI r1, 84
  LDI r8, 0xC9F099
  LDI r2, 0x4B8676
  LDI r5, 953
  LDI r4, 501
main_0:
  LDI r9, 10
  LDI r3, 128
  LDI r9, 443
  DRAWTEXT r9, r3, r9, "WORLD"
  SHL r3, r1, r15
  FRAME
  JMP main_0
