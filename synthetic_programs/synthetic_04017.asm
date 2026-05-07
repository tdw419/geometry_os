; input driven program
; initialization
  LDI r1, 1
  LDI r13, 0x773AE5
  LDI r10, 64
  LDI r6, 1
main_0:
  IKEY r3
  CMPI r3, 16
  JNZ r3, key_1
  LDI r3, 255
  LDI r9, 0xE33FDC
  LDI r1, 4
  LDI r18, 2363
  LDI r15, 128
  RECTF r3, r9, r1, r18, r15
  CMP r12, r10
  CMPI r11, 69
  FRAME
  JMP main_0
