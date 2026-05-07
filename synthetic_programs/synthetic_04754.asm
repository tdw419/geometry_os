; drawing loop program
; initialization
  LDI r6, 2
  LDI r12, 0xBA2F77
main_0:
  ADD r3, r9, r12
  CMPI r10, 28
  FRAME
  JMP main_0
