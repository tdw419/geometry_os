; drawing loop program
; initialization
  LDI r12, 0xF4D9A8
  LDI r0, 2115
  LDI r13, 255
  LDI r7, 0xAC92B5
  LDI r9, 3186
; palette
  LDI r4, 0x24E6
  LDI r1, 1
  LDI r5, 0xFF4400
  STORE r4, r5
  ADD r4, r4, r1
  LDI r5, 0xFF8800
  STORE r4, r5
  ADD r4, r4, r1
  LDI r5, 0x444444
  STORE r4, r5
  ADD r4, r4, r1
  LDI r5, 0x000066
  STORE r4, r5
  ADD r4, r4, r1
  LDI r5, 0xAA00AA
  STORE r4, r5
  ADD r4, r4, r1
  LDI r5, 0x00FFFF
  STORE r4, r5
  ADD r4, r4, r1
  LDI r5, 0xFFFF00
  STORE r4, r5
  ADD r4, r4, r1
  LDI r5, 0xFFAA00
  STORE r4, r5
  ADD r4, r4, r1
  LDI r5, 0xFFFF00
  STORE r4, r5
  ADD r4, r4, r1
main_0:
  AND r11, r10, r14
  SUB r6, r11, r12
  LDI r15, 0x0278F7
  LDI r15, 8
  LDI r14, 4
  LDI r1, 0x6B88FA
  LDI r10, 8
  LINE r15, r15, r14, r1, r10
  MOD r16, r2, r13
  FRAME
  JMP main_0
