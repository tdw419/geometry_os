; input driven program
; initialization
  LDI r15, 256
  LDI r2, 1842
main_0:
  CMPI r0, r4, 249
  ADDI r11, r0, 0x73B000
  IKEY r7
  CMPI r7, 37
  JNZ r7, key_1
  FRAME
  JMP main_0
