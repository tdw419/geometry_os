; drawing loop program
; initialization
  LDI r1, 0x027D79
  LDI r15, 3622
  LDI r9, 2956
  LDI r12, 1138
  LDI r5, 424
main_0:
  LDI r12, 696
  LDI r9, 3378
  LDI r12, 8
  DRAWTEXT r12, r9, r12, "WORLD"
  XOR r11, r0, r26
  XOR r1, r11, r4
  XOR r14, r8, r15
  IKEY r2
  CMPI r2, 0x2FC3A9
  JNZ r2, key_1
  DIV r10, r14, r0
  OR r1, r7, r29
  FRAME
  JMP main_0
