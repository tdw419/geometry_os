; mixed program
; initialization
  LDI r7, 0
  LDI r4, 10
  LDI r13, 469
  LDI r9, 255
  LDI r11, 1222
  IKEY r10
  CMPI r10, 1
  JNZ r10, key_0
  LDI r8, 931
  LDI r6, 10
  LDI r13, 0x902FCB
  DRAWTEXT r8, r6, r13, "WORLD"
  LDI r4, 0xFD7856
  LDI r14, 806
  LDI r4, 10
  TEXT r4, r14, r4, "HELLO"
  PUSH r13
  PUSH r5
  OR r12, r8, r1
  AND r0, r3, r9
  AND r3, r8, r7
  POP r5
  POP r13
  LDI r14, 461
  STORE r14, r9
  LOAD r19, r14
  LDI r6, 64
  STORE r6, r0
  LOAD r9, r6
  LDI r5, 60
  STORE r5, r7
  LOAD r2, r5
  LDI r0x80C8, 0x80C836
  STORE r1, r6
  LOAD r2, r1
  LDI r10, 0x1DC3C1
  STORE r10, r11
  LOAD r15, r10
main_1:
  ANDI r12, r8, 0xB08C22
  IKEY r11
  CMPI r11, 39
  JNZ r11, key_2
  FRAME
  JMP main_1
