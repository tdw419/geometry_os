; drawing loop program
; initialization
  LDI r12, 4038
  LDI r9, 0x34AFE4
  LDI r10, 0x4621AF
  LDI r8, 1
  LDI r14, 3249
  LDI r13, 3518
  LDI r2, 1
  LDI r15, 0xF1119D
main_0:
  LDI r14, 3066
  LDI r11, 369
  LDI r10, 1533
  DRAWTEXT r14, r11, r10, "WORLD"
  AND r13, r8, r3
  OR r4, r10, r11
  FRAME
  JMP main_0
