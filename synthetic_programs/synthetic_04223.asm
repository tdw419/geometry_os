; input driven program
; initialization
  LDI r5, 1839
  LDI r12, 0x9DE556
  LDI r6, 255
  LDI r30, 0x590D1E
  LDI r3, 0x454593
  LDI r14, 2284
main_0:
  XOR r13, r3, r8
  IKEY r3
  CMPI r3, 0x062DC6
  JNZ r3, key_1
  LDI r2, 3331
  LDI r5, 32
  LDI r5, 255
  TEXT r2, r5, r5, "HELLO"
  IKEY r31
  CMPI r31, 0x985190
  JNZ r31, key_2
  IKEY r8
  CMPI r8, 255
  JNZ r8, key_3
  FRAME
  JMP main_0
