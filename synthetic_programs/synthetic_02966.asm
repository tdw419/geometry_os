; input driven program
; initialization
  LDI r12, 3792
  LDI r11, 0x3728CE
  LDI r1, 3468
  LDI r15, 2986
  LDI r0, 1904
  LDI r7, 3979
  LDI r9, 1398
main_0:
  IKEY r1
  CMPI r1, 37
  JNZ r1, key_1
  IKEY r8
  CMPI r8, 211
  JNZ r8, key_2
  FRAME
  JMP main_0
