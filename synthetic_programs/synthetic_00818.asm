; input driven program
; initialization
  LDI r3, 2095
  LDI r7, 348
  LDI r8, 32
  LDI r9, 0xAD532B
  LDI r2, 0xFB08D5
  LDI r11, 3010
  LDI r14, 2
main_0:
  CMPI r4, 0x1A1DE0
  CMPI r1, r26, 0x0A98D4
  IKEY r3
  CMPI r3, 255
  JNZ r3, key_1
  CMP r9, r11
  FRAME
  JMP main_0
