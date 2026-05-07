; input driven program
; initialization
  LDI r5, 2113
  LDI r8, 0x54B79B
  LDI r12, 380
  LDI r13, 256
  LDI r4, 0x39DE0E
  LDI r14, 0x7FFB2B
  LDI r10, 32
main_0:
  OR r17, r12, r8
  OR r3, r6, r9
  OR r0, r4, r15
  OR r13, r4, r3
  ANDI r12, r4, 11
  IKEY r10
  CMPI r10, 32
  JNZ r10, key_1
  IKEY r13
  CMPI r13, 0x20BF3C
  JNZ r13, key_2
  FRAME
  JMP main_0
