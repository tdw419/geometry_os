; drawing loop program
; initialization
  LDI r8, 539
  LDI r2, 1612
main_0:
  IKEY r0
  CMPI r0, 61
  JNZ r0, key_1
  LDI r9, 3135
  LDI r14, 0x424568
  LDI r14, 2590
  PSET r9, r14, r14
  LDI r2, 256
  LDI r4, 3436
  LDI r11, 28
  DRAWTEXT r2, r4, r11, "WORLD"
  IKEY r4
  CMPI r4, 54
  JNZ r4, key_2
  CMP r6, r13
  CMPI r5, r1, 10
  FRAME
  JMP main_0
