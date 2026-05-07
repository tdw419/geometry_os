; input driven program
; initialization
  LDI r25, 128
  LDI r13, 0x3D69F4
  LDI r15, 1478
  LDI r1, 10
  LDI r5, 32
  LDI r16, 3262
  LDI r2, 0
main_0:
  SHR r1, r4, r15
  SHR r8, r1, r2
  ANDI r0, r3, 8
  ANDI r3, r13, 243
  MUL r1, r25, r9
  CMPI r5, 8
  FRAME
  JMP main_0
