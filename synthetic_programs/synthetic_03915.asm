; input driven program
; initialization
  LDI r11, 0x96DB8E
  LDI r13, 2
  LDI r9, 0x20EFFE
  LDI r2, 2422
  LDI r16, 0
  LDI r10, 1
main_0:
  IKEY r3
  CMPI r3, 0xAD5C97
  JNZ r3, key_1
  MUL r11, r8, r9
  LDI r0, 8
  LDI r4, 255
  LDI r3, 0x3EF944
  TEXT r0, r4, r3, "HELLO"
  LDI r13, 4
  LDI r5, 0x917AA8
  LDI r7, 0xA6F041
  DRAWTEXT r13, r5, r7, "WORLD"
  LDI r6, 3501
  LDI r2, 256
  LDI r14, 0xDA29A6
  TEXT r6, r2, r14, "HELLO"
  FRAME
  JMP main_0
