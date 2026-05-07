; mixed program
; initialization
  LDI r10, 256
  LDI r11, 256
  IKEY r10
  CMPI r10, 45
  JNZ r10, key_0
  IKEY r11
  CMPI r11, 4
  JNZ r11, key_1
  DIV r3, r4, r25
  LDI r9, 2
  LDI r8, 1394
  LDI r3, 10
  TEXT r9, r8, r3, "HELLO"
  XOR r9, r10, r11
  AND r12, r8, r14
  LDI r16, 0xF6D093
  STORE r16, r7
  LOAD r5, r16
  LDI r5, 964
  STORE r5, r3
  LOAD r8, r5
  LDI r8, 3110
  STORE r8, r12
  LOAD r15, r8
  LDI r13, 64
  LDI r5, 0x18DC41
  LDI r4, 0xB7F85D
  PSETI
  HALT
