; drawing loop program
; initialization
  LDI r13, 0x4BB6B2
  LDI r8, 548
  LDI r12, 3753
  LDI r0, 3437
  LDI r4, 0x334DF0
main_0:
  MOD r11, r8, r15
  LDI r8, 3290
  LDI r10, 32
  LDI r11, 0x9B2A04
  TEXT r8, r10, r11, "HELLO"
  LDI r3, 8
  LDI r30, 256
  LDI r2, 0x6C3B60
  DRAWTEXT r3, r30, r2, "WORLD"
  CMPI r11, r5, 0xCE887F
  CMPI r0, 0x66C5A8
  LDI r1, 2244
  LDI r14, 1014
  LDI r7, 1454
  LDI r31, 2
  LDI r8, 2335
  RECTF r1, r14, r7, r31, r8
  FRAME
  JMP main_0
