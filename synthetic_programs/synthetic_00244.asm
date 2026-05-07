; input driven program
; initialization
  LDI r10, 32
  LDI r4, 0x858986
main_0:
  CMPI r14, r1, 255
  CMP r3, r2
  LDI r7, 3630
  LDI r10, 983
  LDI r5, 128
  TEXT r7, r10, r5, "HELLO"
  FRAME
  JMP main_0
