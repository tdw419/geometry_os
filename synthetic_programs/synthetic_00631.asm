; input driven program
; initialization
  LDI r14, 0xE7B200
  LDI r11, 872
  LDI r5, 1625
  LDI r7, 0xC23396
  LDI r15, 0xCEE7D2
main_0:
  CMPI r10, 0xC02C2C
  IKEY r6
  CMPI r6, 69
  JNZ r6, key_1
  CMPI r15, r12, 0x647B09
  FRAME
  JMP main_0
