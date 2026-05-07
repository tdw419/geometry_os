; drawing loop program
; initialization
  LDI r6, 32
  LDI r4, 16
  LDI r28, 2733
  LDI r1, 0xB87A24
  LDI r11, 1763
main_0:
  LDI r1, 2208
  LDI r10, 255
  LDI r15, 2242
  DRAWTEXT r1, r10, r15, "WORLD"
  MOD r3, r24, r2
  AND r1, r13, r12
  OR r11, r10, r7
  XOR r7, r15, r11
  XOR r7, r4, r3
  OR r12, r8, r9
  XOR r12, r7, r10
  XOR r11, r6, r3
  FRAME
  JMP main_0
