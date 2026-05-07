; input driven program
; initialization
  LDI r13, 1666
  LDI r5, 1396
  LDI r3, 883
  LDI r11, 64
  LDI r15, 0x42972E
  LDI r12, 0x67BAC6
  LDI r2, 0xFECE72
  LDI r10, 32
main_0:
  IKEY r4
  CMPI r4, 10
  JNZ r4, key_1
  CMPI r2, 0xEB6BB7
  FRAME
  JMP main_0
