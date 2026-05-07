; input driven program
; initialization
  LDI r9, 3280
  LDI r8, 1371
  LDI r10, 0x708412
  LDI r13, 1274
  LDI r5, 4
  LDI r12, 1
  LDI r2, 0x8C56FD
main_0:
  CMPI r1, 128
  LDI r14, 0x2AC1AA
  LDI r10, 256
  LDI r3, 16
  TEXT r14, r10, r3, "HELLO"
  FRAME
  JMP main_0
