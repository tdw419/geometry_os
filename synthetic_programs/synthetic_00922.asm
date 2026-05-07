; input driven program
; initialization
  LDI r15, 10
  LDI r21, 87
  LDI r24, 32
  LDI r7, 3854
  LDI r0, 1
  LDI r4, 292
  LDI r2, 0xEA64BC
main_0:
  SHLI r9, r3, 0xF52870
  SHLI r9, r6, 8
  IKEY r15
  CMPI r15, 128
  JNZ r15, key_1
  LDI r5, 0x0BE1E6
  FILL r5
  FRAME
  JMP main_0
