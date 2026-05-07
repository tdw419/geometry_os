; drawing loop program
; initialization
  LDI r12, 0xCBFC24
  LDI r7, 780
  LDI r2, 16
main_0:
  OR r7, r6, r12
  CMPI r0, r15, 8
  FRAME
  JMP main_0
