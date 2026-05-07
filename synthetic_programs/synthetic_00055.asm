; input driven program
; initialization
  LDI r1, 64
  LDI r3, 42
  LDI r7, 1915
  LDI r9, 1146
  LDI r6, 1
  LDI r13, 0
main_0:
  CMP r11, r12
  ANDI r13, r31, 2
  CMPI r14, 0x3C721E
  IKEY r1
  CMPI r1, 189
  JNZ r1, key_1
  XOR r3, r9, r4
  FRAME
  JMP main_0
