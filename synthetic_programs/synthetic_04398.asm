; input driven program
; initialization
  LDI r23, 0
  LDI r5, 128
main_0:
  LDI r2, 0xC5F6AC
  FILL r2
  CMPI r12, r13, 130
  LDI r3, 4
  LDI r10, 256
  LDI r15, 256
  PSETI
  FRAME
  JMP main_0
