; drawing loop program
; initialization
  LDI r14, 32
  LDI r13, 1875
main_0:
  OR r17, r14, r13
  IKEY r11
  CMPI r11, 0xF8C8E3
  JNZ r11, key_1
  SHLI r8, r3, 0x788453
  SHR r15, r12, r8
  XOR r13, r2, r9
  LDI r11, 32
  LDI r6, 2
  LDI r10, 0xEE1E42
  LDI r9, 2907
  CIRCLE r11, r6, r10, r9
  FRAME
  JMP main_0
