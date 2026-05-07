; drawing loop program
; initialization
  LDI r3, 2184
  LDI r13, 0x1664FD
  LDI r0, 10
  LDI r2, 3070
  LDI r12, 4
  LDI r5, 256
  LDI r1, 4070
  LDI r14, 0x244758
main_0:
  LDI r1, 1
  LDI r13, 1
  LDI r27, 1227
  DRAWTEXT r1, r13, r27, "WORLD"
  LDI r6, 4
  LDI r8, 0x225E46
  LDI r6, 255
  TEXT r6, r8, r6, "HELLO"
  SHLI r10, r14, 0x3BB0AA
  SAR r10, r8, r12
  SAR r4, r6, r15
  XOR r3, r4, r2
  OR r4, r14, r11
  OR r4, r15, r8
  CMP r6, r10
  IKEY r9
  CMPI r9, 256
  JNZ r9, key_1
  FRAME
  JMP main_0
