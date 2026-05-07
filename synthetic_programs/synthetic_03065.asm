; input driven program
; initialization
  LDI r2, 441
  LDI r14, 4
main_0:
  IKEY r1
  CMPI r1, 10
  JNZ r1, key_1
  CMPI r0, r2, 0xC49B56
  IKEY r14
  CMPI r14, 0xFDB425
  JNZ r14, key_2
  SUBI r12, r10, 8
  LDI r6, 718
  LDI r4, 2398
  LDI r15, 0x1C6E46
  TEXT r6, r4, r15, "HELLO"
  LDI r1, 3388
  LDI r1, 1
  LDI r5, 4
  PSET r1, r1, r5
  FRAME
  JMP main_0
