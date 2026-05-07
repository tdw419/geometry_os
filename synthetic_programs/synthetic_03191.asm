; drawing loop program
; initialization
  LDI r15, 0
  LDI r31, 0xBEDD12
  LDI r9, 0xBC229F
  LDI r7, 0x520835
  LDI r4, 16
  LDI r11, 0x4670A9
  LDI r6, 234
main_0:
  IKEY r8
  CMPI r8, 195
  JNZ r8, key_1
  ADDI r4, r9, 128
  FRAME
  JMP main_0
