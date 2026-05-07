; mixed program
; initialization
  LDI r14, 1508
  LDI r2, 32
  LDI r4, 256
  LDI r7, 0x5C0F3B
  LDI r0, 1186
  LDI r3, 1245
  LDI r7, 0xFA2B48
  LDI r0, 32
  LDI r8, 0x8D955A
  LDI r0, 2054
  LDI r7, 0x60C3B6
  RECTF r7, r0, r8, r0, r7
  XOR r11, r14, r6
  IKEY r15
  CMPI r15, 64
  JNZ r15, key_0
  LDI r11, 0x1568F6
  STORE r11, r1
  LOAD r5, r11
  LDI r3, 128
  STORE r3, r6
  LOAD r7, r3
  LDI r8, 0xCD9866
  STORE r8, r5
  LOAD r15, r8
  SHL r8, r27, r12
  SHL r0, r11, r1
  SHL r11, r2, r3
  XOR r8, r5, r1
  XOR r9, r4, r2
  AND r1, r6, r13
  AND r9, r15, r8
main_1:
  IKEY r0
  CMPI r0, 0x8BFCFB
  JNZ r0, key_2
  ANDI r12, r2, 0xBB04C3
  LDI r4, 8
  LDI r0, 1050
  LDI r0, 3041
  LDI r10, 2
  LDI r1, 2176
  RECTF r4, r0, r0, r10, r1
  FRAME
  JMP main_1
