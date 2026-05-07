; input driven program
; initialization
  LDI r13, 2
  LDI r7, 0xAA2669
  LDI r0, 16
  LDI r2, 0x3AAF4B
  LDI r15, 4033
  LDI r26, 0
main_0:
  CMP r11, r0
  CMPI r24, r14, 32
  IKEY r8
  CMPI r8, 0xAAA613
  JNZ r8, key_1
  FRAME
  JMP main_0
