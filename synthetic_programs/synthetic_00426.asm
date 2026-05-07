; drawing loop program
; initialization
  LDI r18, 2016
  LDI r11, 1
  LDI r12, 354
  LDI r5, 2107
  LDI r13, 774
  LDI r15, 2996
  LDI r22, 564
; palette
  LDI r7, 0x2464
  LDI r12, 1
  LDI r9, 0xAAAAAA
  STORE r7, r9
  ADD r7, r7, r12
  LDI r9, 0xFFAA00
  STORE r7, r9
  ADD r7, r7, r12
  LDI r9, 0x8800FF
  STORE r7, r9
  ADD r7, r7, r12
  LDI r9, 0x00FFFF
  STORE r7, r9
  ADD r7, r7, r12
  LDI r9, 0xFFFFFF
  STORE r7, r9
  ADD r7, r7, r12
  LDI r9, 0x00FFFF
  STORE r7, r9
  ADD r7, r7, r12
  LDI r9, 0x8800FF
  STORE r7, r9
  ADD r7, r7, r12
  LDI r9, 0xAAFF00
  STORE r7, r9
  ADD r7, r7, r12
main_0:
  CMPI r8, r12, 33
  SHL r12, r2, r0
  ANDI r11, r15, 256
  FRAME
  JMP main_0
