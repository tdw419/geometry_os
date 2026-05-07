; input driven program
; initialization
  LDI r13, 0xD2C1B6
  LDI r3, 0xD7B87E
  LDI r6, 8
  LDI r8, 2358
  LDI r9, 0x5B4CAF
  LDI r2, 1266
main_0:
  AND r2, r5, r13
  XOR r12, r5, r28
  IKEY r11
  CMPI r11, 2
  JNZ r11, key_1
  SAR r16, r6, r3
  SHLI r15, r6, 8
  LDI r8, 255
  LDI r13, 4043
  LDI r13, 0x894014
  TEXT r8, r13, r13, "HELLO"
  FRAME
  JMP main_0
