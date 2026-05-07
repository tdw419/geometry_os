; input driven program
; initialization
  LDI r15, 256
  LDI r10, 0x7C6E0F
  LDI r0, 807
  LDI r11, 444
  LDI r5, 0x16C432
  LDI r14, 3591
main_0:
  IKEY r11
  CMPI r11, 4
  JNZ r11, key_1
  ADDI r1, r8, 16
  XOR r10, r2, r5
  IKEY r2
  CMPI r2, 0x4C65F5
  JNZ r2, key_2
  FRAME
  JMP main_0
