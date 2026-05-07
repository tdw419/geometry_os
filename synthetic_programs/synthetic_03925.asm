; drawing loop program
; initialization
  LDI r10, 0x64E654
  LDI r4, 0x701810
  LDI r3, 4
  LDI r11, 255
  LDI r1, 1725
  LDI r20, 2
  LDI r2, 1693
; palette
  LDI r4, 0x230F
  LDI r1, 1
  LDI r0, 0xDD0044
  STORE r4, r0
  ADD r4, r4, r1
  LDI r0, 0x880088
  STORE r4, r0
  ADD r4, r4, r1
  LDI r0, 0x00AAFF
  STORE r4, r0
  ADD r4, r4, r1
  LDI r0, 0xDD0044
  STORE r4, r0
  ADD r4, r4, r1
  LDI r0, 0x000066
  STORE r4, r0
  ADD r4, r4, r1
  LDI r0, 0xFF00FF
  STORE r4, r0
  ADD r4, r4, r1
  LDI r0, 0x0044FF
  STORE r4, r0
  ADD r4, r4, r1
  LDI r0, 0x00FF00
  STORE r4, r0
  ADD r4, r4, r1
  LDI r0, 0xFFAA00
  STORE r4, r0
  ADD r4, r4, r1
  LDI r0, 0xFFEE00
  STORE r4, r0
  ADD r4, r4, r1
main_0:
  SHR r9, r10, r7
  LDI r8, 3975
  LDI r3, 2613
  LDI r12, 255
  DRAWTEXT r8, r3, r12, "WORLD"
  ADDI r23, r6, 0xC1117D
  MOD r1, r8, r0
  FRAME
  JMP main_0
