; input driven program
; initialization
  LDI r2, 128
  LDI r12, 0xD09772
  LDI r6, 1690
  LDI r13, 2995
  LDI r10, 256
main_0:
  SHR r6, r1, r7
  IKEY r12
  CMPI r12, 95
  JNZ r12, key_1
  LDI r23, 255
  LDI r10, 0x282D78
  LDI r2, 2549
  PSET r23, r10, r2
  FRAME
  JMP main_0
