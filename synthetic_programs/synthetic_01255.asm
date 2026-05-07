; drawing loop program
; initialization
  LDI r13, 3483
  LDI r0, 2901
; palette
  LDI r20, 0x4094
  LDI r8, 1
  LDI r12, 0x0000CC
  STORE r20, r12
  ADD r20, r20, r8
  LDI r12, 0x0000FF
  STORE r20, r12
  ADD r20, r20, r8
  LDI r12, 0x008888
  STORE r20, r12
  ADD r20, r20, r8
  LDI r12, 0xAAAAAA
  STORE r20, r12
  ADD r20, r20, r8
  LDI r12, 0x0000FF
  STORE r20, r12
  ADD r20, r20, r8
  LDI r12, 0x888800
  STORE r20, r12
  ADD r20, r20, r8
  LDI r12, 0xFF00FF
  STORE r20, r12
  ADD r20, r20, r8
  LDI r12, 0x00AAFF
  STORE r20, r12
  ADD r20, r20, r8
  LDI r12, 0xFFFFFF
  STORE r20, r12
  ADD r20, r20, r8
main_0:
  LDI r11, 0x38880F
  LDI r3, 3205
  LDI r4, 0x7721C2
  WPIXEL
  OR r15, r3, r4
  FRAME
  JMP main_0
