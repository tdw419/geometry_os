; input driven program
; initialization
  LDI r7, 32
  LDI r9, 130
  LDI r4, 255
  LDI r1, 0x3D89BA
main_0:
  CMP r12, r0
  CMPI r15, 32
  IKEY r12
  CMPI r12, 4
  JNZ r12, key_1
  FRAME
  JMP main_0
