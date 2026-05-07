; drawing loop program
; initialization
  LDI r8, 0xB7EFC5
  LDI r9, 0x58302D
  LDI r3, 1383
  LDI r7, 0x12FB1D
  LDI r5, 256
main_0:
  IKEY r14
  CMPI r14, 64
  JNZ r14, key_1
  CMP r28, r11
  IKEY r1
  CMPI r1, 0xFBA61E
  JNZ r1, key_2
  AND r25, r7, r15
  AND r9, r4, r1
  OR r5, r4, r2
  LDI r3, 10
  LDI r9, 8
  LDI r11, 0xF119B7
  PSET r3, r9, r11
  FRAME
  JMP main_0
