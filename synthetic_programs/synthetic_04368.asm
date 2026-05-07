; input driven program
; initialization
  LDI r12, 3802
  LDI r14, 1998
  LDI r7, 0x7DEB56
  LDI r13, 0x8D26AB
main_0:
  CMP r0, r5
  SHL r9, r13, r8
  SHLI r5, r1, 16
  SHLI r13, r11, 0x37B702
  IKEY r10
  CMPI r10, 235
  JNZ r10, key_1
  FRAME
  JMP main_0
