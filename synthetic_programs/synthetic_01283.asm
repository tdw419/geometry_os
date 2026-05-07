; drawing loop program
; initialization
  LDI r3, 128
  LDI r13, 1
  LDI r8, 938
  LDI r0, 1355
main_0:
  IKEY r13
  CMPI r13, 143
  JNZ r13, key_1
  IKEY r13
  CMPI r13, 166
  JNZ r13, key_2
  CMPI r2, 0x498AE4
  SHLI r1, r12, 5
  SHLI r7, r1, 256
  SHR r28, r0, r13
  IKEY r8
  CMPI r8, 188
  JNZ r8, key_3
  FRAME
  JMP main_0
