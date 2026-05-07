; mixed program
; initialization
  LDI r7, 2285
  LDI r9, 2464
  LDI r4, 2763
  LDI r0, 2
  LDI r17, 0xD28CBA
  LDI r11, 0xE2C064
  LDI r13, 64
  LDI r12, 10
  PUSH r2
  PUSH r13
  PUSH r11
  ADD r6, r11, r7
  OR r5, r9, r8
  POP r11
  POP r13
  POP r2
  SHL r4, r6, r1
  SHLI r7, r2, 64
  SHL r13, r2, r7
  IKEY r15
  CMPI r15, 8
  JNZ r15, key_0
  XOR r15, r21, r2
  AND r15, r14, r5
  OR r0, r7, r5
  AND r15, r7, r12
  IKEY r14
  CMPI r14, 255
  JNZ r14, key_1
main_2:
  SHLI r6, r5, 2
  SHR r2, r15, r11
  SHL r3, r10, r15
  SAR r11, r10, r15
  ANDI r12, r3, 0x013223
  LDI r10, 0xB86AD8
  LDI r11, 10
  LDI r11, 0xEA414B
  TEXT r10, r11, r11, "HELLO"
  IKEY r6
  CMPI r6, 0xDAA451
  JNZ r6, key_3
  CMPI r15, r10, 0x88E098
  FRAME
  JMP main_2
