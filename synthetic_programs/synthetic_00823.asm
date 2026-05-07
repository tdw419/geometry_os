; drawing loop program
; initialization
  LDI r31, 3929
  LDI r9, 0xB60900
  LDI r8, 0xC2D1C8
  LDI r11, 3299
  LDI r4, 0x78E885
  LDI r6, 0x0525CA
  LDI r13, 3159
main_0:
  LDI r8, 0xDB0BFA
  LDI r6, 0x3AE309
  LDI r13, 0xB98FAB
  DRAWTEXT r8, r6, r13, "WORLD"
  OR r12, r9, r6
  FRAME
  JMP main_0
