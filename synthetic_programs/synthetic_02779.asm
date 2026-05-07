; input driven program
; initialization
  LDI r4, 0x927960
  LDI r9, 0xE24D62
  LDI r12, 1938
  LDI r11, 256
main_0:
  LDI r15, 2819
  LDI r1, 3324
  LDI r2, 4
  TEXT r15, r1, r2, "HELLO"
  IKEY r9
  CMPI r9, 0x686B47
  JNZ r9, key_1
  SAR r23, r15, r9
  SAR r1, r5, r3
  SAR r2, r12, r10
  SAR r15, r31, r3
  FRAME
  JMP main_0
