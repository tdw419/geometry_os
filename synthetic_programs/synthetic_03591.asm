; input driven program
; initialization
  LDI r2, 2
  LDI r10, 0xD9188E
  LDI r4, 0xD74068
  LDI r14, 2589
  LDI r7, 256
main_0:
  CMPI r3, 64
  MUL r9, r7, r6
  FRAME
  JMP main_0
