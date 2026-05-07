; drawing loop program
; initialization
  LDI r13, 0xC63E1A
  LDI r12, 4
  LDI r15, 3012
  LDI r4, 1009
  LDI r8, 0xB8D03C
; palette
  LDI r8, 0x702B
  LDI r12, 1
  LDI r2, 0x00FFAA
  STORE r8, r2
  ADD r8, r8, r12
  LDI r2, 0xFFEE00
  STORE r8, r2
  ADD r8, r8, r12
  LDI r2, 0xFF8800
  STORE r8, r2
  ADD r8, r8, r12
  LDI r2, 0x00FFAA
  STORE r8, r2
  ADD r8, r8, r12
  LDI r2, 0x000000
  STORE r8, r2
  ADD r8, r8, r12
  LDI r2, 0x00AAFF
  STORE r8, r2
  ADD r8, r8, r12
  LDI r2, 0xAAAAAA
  STORE r8, r2
  ADD r8, r8, r12
  LDI r2, 0x000000
  STORE r8, r2
  ADD r8, r8, r12
  LDI r2, 0x0044FF
  STORE r8, r2
  ADD r8, r8, r12
  LDI r2, 0xFFAA00
  STORE r8, r2
  ADD r8, r8, r12
  LDI r2, 0x00FF00
  STORE r8, r2
  ADD r8, r8, r12
  LDI r2, 0x0044FF
  STORE r8, r2
  ADD r8, r8, r12
  LDI r2, 0x000000
  STORE r8, r2
  ADD r8, r8, r12
main_0:
  CMPI r3, r1, 28
  LDI r1, 0x732ABB
  LDI r11, 3711
  LDI r9, 2683
  DRAWTEXT r1, r11, r9, "WORLD"
  ADD r0, r15, r3
  LDI r11, 0x5A6CB1
  LDI r1, 0x93FFA8
  LDI r5, 1881
  DRAWTEXT r11, r1, r5, "WORLD"
  CMP r5, r15
  XOR r14, r10, r13
  OR r14, r8, r5
  OR r8, r5, r2
  OR r11, r6, r1
  FRAME
  JMP main_0
