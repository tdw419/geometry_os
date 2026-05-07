; input driven program
; initialization
  LDI r8, 128
  LDI r14, 32
  LDI r7, 2
  LDI r13, 0x95E67C
main_0:
  LDI r3, 256
  LDI r1, 8
  LDI r7, 0xAD2B21
  DRAWTEXT r3, r1, r7, "WORLD"
  IKEY r14
  CMPI r14, 234
  JNZ r14, key_1
  CMPI r5, r11, 206
  LDI r15, 2312
  LDI r3, 4
  LDI r7, 256
  PSETI
  XOR r6, r10, r13
  AND r8, r5, r15
  OR r2, r9, r3
  LDI r4, 1447
  LDI r11, 3441
  LDI r9, 256
  TEXT r4, r11, r9, "HELLO"
  FRAME
  JMP main_0
