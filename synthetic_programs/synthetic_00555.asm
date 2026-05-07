; drawing loop program
; initialization
  LDI r8, 256
  LDI r9, 10
main_0:
  SUBI r1, r4, 157
  AND r11, r6, r7
  AND r30, r1, r10
  OR r8, r2, r13
  LDI r2, 32
  LDI r4, 0x285880
  LDI r3, 2894
  DRAWTEXT r2, r4, r3, "WORLD"
  LDI r3, 0x37D570
  LDI r15, 0x27D278
  LDI r9, 10
  TEXT r3, r15, r9, "HELLO"
  FRAME
  JMP main_0
