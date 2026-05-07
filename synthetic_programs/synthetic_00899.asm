; drawing loop program
; initialization
  LDI r0, 32
  LDI r29, 2766
  LDI r7, 1693
  LDI r14, 10
  LDI r4, 0
  LDI r12, 256
  LDI r8, 0x352951
; palette
  LDI r2, 0x30FB
  LDI r7, 1
  LDI r3, 0xFFFFFF
  STORE r2, r3
  ADD r2, r2, r7
  LDI r3, 0x0000CC
  STORE r2, r3
  ADD r2, r2, r7
  LDI r3, 0xFF00FF
  STORE r2, r3
  ADD r2, r2, r7
  LDI r3, 0x000066
  STORE r2, r3
  ADD r2, r2, r7
  LDI r3, 0xFFFFFF
  STORE r2, r3
  ADD r2, r2, r7
main_0:
  LDI r3, 3126
  LDI r4, 196
  LDI r3, 0x3845E3
  WPIXEL
  LDI r12, 0xB74F2F
  LDI r11, 64
  LDI r2, 1122
  PSETI
  FRAME
  JMP main_0
