; input driven program
; initialization
  LDI r13, 10
  LDI r9, 712
  LDI r12, 64
  LDI r15, 1387
main_0:
  SAR r7, r11, r13
  SAR r2, r9, r7
  SHR r7, r3, r6
  SAR r2, r6, r15
  IKEY r0
  CMPI r0, 0x50C4EC
  JNZ r0, key_1
  CMPI r12, 0xBBEFC1
  CMP r7, r11
  FRAME
  JMP main_0
