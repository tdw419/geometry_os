; mixed program
; initialization
  LDI r12, 1863
  LDI r7, 2483
  LDI r30, 3226
  LDI r9, 0x22DE24
  LDI r4, 4
  LDI r25, 1
  LDI r14, 0x7B9B54
  LDI r9, 16
  LDI r8, 1035
  LDI r7, 2047
  TEXT r9, r8, r7, "HELLO"
  OR r7, r6, r5
  SAR r9, r5, r8
  SHR r7, r0, r26
  SHR r1, r14, r11
  LDI r9, 1239
  LDI r1, 0x33EDA3
  LDI r5, 0xF4DE38
  DRAWTEXT r9, r1, r5, "WORLD"
  LDI r3, 49
loop_0:
  ANDI r2, r12, 0xFCFFF1
  CMPI r11, r8, 167
  OR r1, r7, r12
  LDI r8, 1
  SUB r3, r3, r8
  JNZ r3, loop_0
  IKEY r4
  CMPI r4, 10
  JNZ r4, key_1
  LDI r2, 0x6A2B97
  LDI r12, 0xDFDB75
  LDI r1, 2113
  PSET r2, r12, r1
  HALT
