; input driven program
; initialization
  LDI r4, 0xDC1D9B
  LDI r5, 0x3A5BD5
main_0:
  CMPI r10, 0x6D7642
  AND r12, r9, r0
  XOR r3, r14, r5
  LDI r6, 0x60FB69
  LDI r15, 0xBD6DA5
  LDI r0, 3992
  TEXT r6, r15, r0, "HELLO"
  SUB r6, r15, r9
  FRAME
  JMP main_0
