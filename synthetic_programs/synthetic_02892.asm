; input driven program
; initialization
  LDI r14, 0xF2FD5D
  LDI r11, 0x543C84
  LDI r8, 155
main_0:
  IKEY r2
  CMPI r2, 67
  JNZ r2, key_1
  IKEY r8
  CMPI r8, 64
  JNZ r8, key_2
  IKEY r3
  CMPI r3, 0x9ED2CD
  JNZ r3, key_3
  ANDI r6, r15, 0xFA4FB0
  ADDI r4, r15, 195
  FRAME
  JMP main_0
