; drawing loop program
; initialization
  LDI r10, 1591
  LDI r7, 1910
  LDI r6, 8
  LDI r4, 265
  LDI r11, 4057
  LDI r13, 284
  LDI r12, 3274
main_0:
  AND r2, r5, r4
  CMP r13, r4
  IKEY r2
  CMPI r2, 64
  JNZ r2, key_1
  CMP r11, r4
  CMPI r8, r4, 128
  FRAME
  JMP main_0
