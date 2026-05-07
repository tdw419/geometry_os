; drawing loop program
; initialization
  LDI r10, 0xB05994
  LDI r9, 256
  LDI r4, 256
main_0:
  CMP r3, r5
  CMPI r8, 170
  FRAME
  JMP main_0
