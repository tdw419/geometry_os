; drawing loop program
; initialization
  LDI r4, 1879
  LDI r15, 3216
  LDI r11, 255
main_0:
  IKEY r7
  CMPI r7, 8
  JNZ r7, key_1
  LDI r13, 2986
  LDI r10, 602
  LDI r14, 8
  PSET r13, r10, r14
  FRAME
  JMP main_0
