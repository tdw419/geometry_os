; input driven program
; initialization
  LDI r10, 0x6A8E43
  LDI r15, 1362
  LDI r13, 0xBDC3AE
  LDI r6, 0x481979
  LDI r12, 0x3B9DC8
  LDI r1, 2523
main_0:
  OR r3, r8, r4
  OR r3, r8, r10
  OR r2, r15, r13
  XOR r3, r10, r7
  XOR r9, r2, r15
  CMP r0, r4
  SUBI r3, r5, 254
  LDI r7, 2891
  LDI r9, 3442
  LDI r8, 2
  TEXT r7, r9, r8, "HELLO"
  FRAME
  JMP main_0
