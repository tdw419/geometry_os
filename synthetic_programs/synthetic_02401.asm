; mixed program
; initialization
  LDI r13, 1970
  LDI r12, 256
  LDI r3, 0x1CC0DA
  LDI r4, 0xABD031
  LDI r6, 255
  LDI r9, 1831
  LDI r2, 0xB3CFDC
  LDI r5, 3083
  LDI r9, 8
  FILL r9
  OR r15, r1, r9
  IKEY r3
  CMPI r3, 0xB3E2E1
  JNZ r3, key_0
  HALT
