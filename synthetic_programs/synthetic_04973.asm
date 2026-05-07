; drawing loop program
; initialization
  LDI r9, 0xC99613
  LDI r14, 0x9DCE09
  LDI r3, 3751
  LDI r15, 764
  LDI r6, 0x2AC608
  LDI r12, 4
  LDI r28, 0xB0DC0C
main_0:
  LDI r3, 3627
  LDI r11, 851
  LDI r9, 3172
  LDI r10, 941
  LDI r3, 0x213B9C
  RECTF r3, r11, r9, r10, r3
  LDI r10, 920
  LDI r7, 255
  LDI r2, 256
  LDI r10, 16
  CIRCLE r10, r7, r2, r10
  AND r11, r12, r6
  AND r2, r13, r9
  OR r1, r15, r11
  OR r9, r5, r14
  LDI r7, 3211
  LDI r4, 64
  LDI r4, 16
  PSET r7, r4, r4
  LDI r13, 0x43C270
  LDI r12, 2143
  LDI r5, 256
  TEXT r13, r12, r5, "HELLO"
  IKEY r14
  CMPI r14, 118
  JNZ r14, key_1
  FRAME
  JMP main_0
