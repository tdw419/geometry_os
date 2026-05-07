; input driven program
; initialization
  LDI r12, 1482
  LDI r6, 585
  LDI r3, 3708
  LDI r15, 128
  LDI r7, 1324
  LDI r14, 2983
  LDI r11, 2634
main_0:
  SHR r18, r4, r2
  LDI r13, 332
  FILL r13
  CMPI r15, 230
  IKEY r11
  CMPI r11, 97
  JNZ r11, key_1
  ANDI r10, r15, 187
  LDI r9, 0xEF8DED
  LDI r4, 1
  LDI r4, 892
  TEXT r9, r4, r4, "HELLO"
  FRAME
  JMP main_0
