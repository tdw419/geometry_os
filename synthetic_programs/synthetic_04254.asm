; drawing loop program
; initialization
  LDI r6, 64
  LDI r12, 503
main_0:
  LDI r8, 3389
  LDI r2, 2730
  LDI r12, 3280
  TEXT r8, r2, r12, "HELLO"
  LDI r4, 0x061972
  LDI r8, 0xC1808D
  LDI r23, 0x41FA6F
  DRAWTEXT r4, r8, r23, "WORLD"
  SAR r8, r7, r12
  SAR r11, r8, r2
  SAR r13, r7, r5
  MOD r9, r1, r18
  FRAME
  JMP main_0
