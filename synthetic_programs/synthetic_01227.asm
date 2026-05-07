; drawing loop program
; initialization
  LDI r1, 0x2D15B7
  LDI r0, 4043
  LDI r4, 0x328512
main_0:
  DIV r3, r11, r8
  IKEY r0
  CMPI r0, 68
  JNZ r0, key_1
  CMP r12, r7
  ANDI r3, r15, 0x08B5CE
  AND r4, r3, r7
  XOR r0, r1, r12
  AND r0, r11, r1
  FRAME
  JMP main_0
