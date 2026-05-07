; input driven program
; initialization
  LDI r10, 53
  LDI r12, 4
  LDI r14, 10
  LDI r4, 0x6371A5
  LDI r3, 4
  LDI r0, 4
main_0:
  IKEY r20
  CMPI r20, 0x7FCD4C
  JNZ r20, key_1
  IKEY r1
  CMPI r1, 161
  JNZ r1, key_2
  LDI r7, 0x029329
  FILL r7
  FRAME
  JMP main_0
