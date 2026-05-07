; drawing loop program
; initialization
  LDI r9, 1
  LDI r4, 0x12B703
  LDI r3, 0x168B18
  LDI r2, 844
  LDI r6, 8
main_0:
  MOD r8, r3, r11
  AND r9, r5, r10
  XOR r4, r1, r12
  AND r14, r9, r6
  AND r2, r14, r9
  LDI r7, 0x841F7D
  LDI r12, 0xA920BE
  LDI r10, 32
  TEXT r7, r12, r10, "HELLO"
  LDI r5, 0xB27DB9
  LDI r4, 256
  LDI r10, 8
  DRAWTEXT r5, r4, r10, "WORLD"
  FRAME
  JMP main_0
