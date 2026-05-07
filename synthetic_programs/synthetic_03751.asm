; drawing loop program
; initialization
  LDI r4, 0xA2357E
  LDI r3, 0x850E95
  LDI r10, 10
  LDI r27, 0x043F90
  LDI r6, 129
  LDI r30, 8
  LDI r13, 64
  LDI r14, 16
main_0:
  DIV r14, r3, r6
  XOR r5, r10, r4
  XOR r7, r2, r11
  FRAME
  JMP main_0
