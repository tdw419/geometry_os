; input driven program
; initialization
  LDI r10, 3593
  LDI r15, 77
  LDI r4, 2
  LDI r0, 10
  LDI r2, 255
  LDI r14, 129
main_0:
  IKEY r11
  CMPI r11, 1
  JNZ r11, key_1
  CMP r6, r1
  SHL r11, r2, r7
  CMPI r19, 2
  FRAME
  JMP main_0
