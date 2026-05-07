; input driven program
; initialization
  LDI r12, 1
  LDI r3, 4
  LDI r10, 2716
  LDI r1, 2972
  LDI r15, 4
  LDI r4, 0x793572
  LDI r21, 256
  LDI r9, 0x322E1B
main_0:
  LDI r6, 0x428FF3
  FILL r6
  IKEY r14
  CMPI r14, 4
  JNZ r14, key_1
  FRAME
  JMP main_0
