; drawing loop program
; initialization
  LDI r6, 3966
  LDI r7, 0x48D85E
  LDI r15, 8
  LDI r9, 32
  LDI r4, 10
  LDI r5, 1
main_0:
  MOD r6, r5, r13
  IKEY r9
  CMPI r9, 199
  JNZ r9, key_1
  LDI r8, 0
  LDI r8, 3660
  LDI r4, 0x510289
  LDI r14, 8
  CIRCLE r8, r8, r4, r14
  LDI r13, 689
  LDI r13, 1
  LDI r2, 3029
  TEXT r13, r13, r2, "HELLO"
  FRAME
  JMP main_0
