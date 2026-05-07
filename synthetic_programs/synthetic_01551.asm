; input driven program
; initialization
  LDI r3, 22
  LDI r9, 2914
  LDI r10, 0xFF2529
  LDI r21, 8
  LDI r4, 3851
  LDI r1, 0x2FE7BD
main_0:
  SHLI r15, r2, 8
  SHLI r4, r9, 0x1D0931
  SAR r2, r14, r10
  CMPI r1, 133
  FRAME
  JMP main_0
