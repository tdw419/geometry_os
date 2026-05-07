; mixed program
; initialization
  LDI r13, 0xD5CB81
  LDI r8, 499
  CMPI r15, 31
  CMP r7, r1
  SHLI r4, r11, 6
  SHLI r8, r2, 0x1AA4B1
  SHR r12, r2, r14
  SHR r13, r4, r10
  LDI r6, 2297
  LDI r15, 0x2660B4
  LDI r15, 256
  TEXT r6, r15, r15, "HELLO"
  CMPI r7, 172
  CMP r7, r14
main_0:
  IKEY r0
  CMPI r0, 1
  JNZ r0, key_1
  LDI r11, 0x52885D
  LDI r11, 3808
  LDI r9, 1372
  TEXT r11, r11, r9, "HELLO"
  FRAME
  JMP main_0
