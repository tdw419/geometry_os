; drawing loop program
; initialization
  LDI r13, 0xC0F515
  LDI r2, 0xB447FF
  LDI r11, 64
  LDI r9, 1908
  LDI r1, 0x1AB3F9
  LDI r12, 4
main_0:
  LDI r6, 10
  LDI r20, 0x63B17D
  LDI r2, 0x689901
  DRAWTEXT r6, r20, r2, "WORLD"
  OR r0, r8, r2
  AND r4, r27, r7
  AND r7, r3, r14
  FRAME
  JMP main_0
