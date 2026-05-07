; drawing loop program
; initialization
  LDI r6, 752
  LDI r4, 0x03BCBD
  LDI r9, 0x748C6F
  LDI r5, 360
  LDI r3, 1463
  LDI r8, 0xF415E4
main_0:
  SUB r8, r5, r1
  SHL r12, r1, r5
  FRAME
  JMP main_0
