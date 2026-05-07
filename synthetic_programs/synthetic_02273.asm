; input driven program
; initialization
  LDI r0, 4
  LDI r2, 2
  LDI r14, 2
  LDI r1, 0xB93202
  LDI r8, 8
main_0:
  AND r2, r9, r11
  LDI r5, 2139
  LDI r2, 0xA9AC7E
  LDI r27, 1
  PSETI
  IKEY r1
  CMPI r1, 2
  JNZ r1, key_1
  IKEY r8
  CMPI r8, 6
  JNZ r8, key_2
  FRAME
  JMP main_0
