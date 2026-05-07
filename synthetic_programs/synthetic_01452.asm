; drawing loop program
; initialization
  LDI r13, 0xB07EFD
  LDI r19, 32
  LDI r5, 0x675A79
  LDI r8, 4
  LDI r2, 0x2F3D70
  LDI r11, 0xDB2568
main_0:
  CMPI r25, r11, 4
  CMPI r1, 30
  DIV r10, r7, r4
  LDI r27, 64
  LDI r4, 4
  LDI r8, 128
  LDI r4, 0x402E3E
  LDI r15, 84
  LINE r27, r4, r8, r4, r15
  SHL r3, r11, r13
  LDI r15, 4
  LDI r2, 0x1972F4
  LDI r6, 4
  LDI r3, 3350
  LDI r6, 0x7282DB
  RECTF r15, r2, r6, r3, r6
  FRAME
  JMP main_0
