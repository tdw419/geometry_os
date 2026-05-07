; input driven program
; initialization
  LDI r9, 0
  LDI r0, 128
  LDI r14, 1
  LDI r7, 2427
  LDI r10, 32
main_0:
  SUBI r4, r8, 0x918FDE
  IKEY r1
  CMPI r1, 92
  JNZ r1, key_1
  FRAME
  JMP main_0
