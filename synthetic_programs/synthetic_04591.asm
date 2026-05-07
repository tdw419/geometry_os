; mixed program
; initialization
  LDI r6, 0
  LDI r13, 0
  LDI r5, 4096
  LDI r14, 0x894DB7
  LDI r10, 0xE3AAD2
  LDI r3, 128
  LDI r4, 0
  IKEY r2
  CMPI r2, 10
  JNZ r2, key_0
  CMP r12, r2
  LDI r6, 0x11CE3C
  LDI r7, 370
  LDI r5, 64
  TEXT r6, r7, r5, "HELLO"
  PUSH r4
  PUSH r5
  SUB r1, r3, r9
  XOR r17, r1, r8
  POP r5
  POP r4
  LDI r11, 0
  STORE r11, r7
  LOAD r15, r11
  LDI r4, 0x900x22485A3
  STORE r4, r9
  LOAD r15, r4
  LDI r4, 0
  FILL r4
  XOR r12, r4, r15
  OR r9, r13, r6
  AND r7, r10, r22
  AND r15, r2, r9
  XOR r5, r3, r9
  AND r13, r6, r11
  HALT
