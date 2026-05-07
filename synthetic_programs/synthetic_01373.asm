; drawing loop program
; initialization
  LDI r1, 3674
  LDI r9, 0xE938DB
  LDI r18, 32
  LDI r13, 2044
  LDI r5, 0xCC81F5
  LDI r4, 256
  LDI r14, 0xFC53A5
  LDI r12, 3712
; palette
  LDI r5, 0x6060
  LDI r1, 1
  LDI r3, 0xFFFFFF
  STORE r5, r3
  ADD r5, r5, r1
  LDI r3, 0x0000CC
  STORE r5, r3
  ADD r5, r5, r1
  LDI r3, 0x550077
  STORE r5, r3
  ADD r5, r5, r1
  LDI r3, 0xFF0000
  STORE r5, r3
  ADD r5, r5, r1
  LDI r3, 0xFFEE00
  STORE r5, r3
  ADD r5, r5, r1
  LDI r3, 0x444444
  STORE r5, r3
  ADD r5, r5, r1
  LDI r3, 0xFFEE00
  STORE r5, r3
  ADD r5, r5, r1
  LDI r3, 0x008888
  STORE r5, r3
  ADD r5, r5, r1
  LDI r3, 0xAAAAAA
  STORE r5, r3
  ADD r5, r5, r1
  LDI r3, 0x8800FF
  STORE r5, r3
  ADD r5, r5, r1
  LDI r3, 0x550077
  STORE r5, r3
  ADD r5, r5, r1
  LDI r3, 0xDD0044
  STORE r5, r3
  ADD r5, r5, r1
  LDI r3, 0x00AAFF
  STORE r5, r3
  ADD r5, r5, r1
  LDI r3, 0xFF0000
  STORE r5, r3
  ADD r5, r5, r1
  LDI r3, 0x550077
  STORE r5, r3
  ADD r5, r5, r1
  LDI r3, 0x888800
  STORE r5, r3
  ADD r5, r5, r1
main_0:
  SHL r3, r11, r15
  SHL r11, r3, r2
  SHR r12, r9, r11
  SHLI r7, r1, 255
  SHL r4, r7, r10
  SHL r8, r13, r4
  ANDI r2, r3, 0xFA0B6E
  CMP r14, r3
  OR r1, r2, r5
  AND r12, r15, r9
  FRAME
  JMP main_0
