; input driven program
; initialization
  LDI r6, 1049
  LDI r7, 147
  LDI r1, 2
  LDI r14, 469
  LDI r11, 3419
  LDI r15, 2109
  LDI r10, 1
  LDI r9, 0
main_0:
  IKEY r15
  CMPI r15, 9
  JNZ r15, key_1
  IKEY r2
  CMPI r2, 16
  JNZ r2, key_2
  XOR r7, r10, r14
  XOR r5, r29, r15
  IKEY r7
  CMPI r7, 255
  JNZ r7, key_3
  FRAME
  JMP main_0
