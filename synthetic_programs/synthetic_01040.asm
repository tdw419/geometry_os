; mixed program
; initialization
  LDI r0, 1534
  LDI r3, 0x1772B0
  LDI r9, 2366
; palette
  LDI r5, 0x80A9
  LDI r7, 1
  LDI r11, 0x444444
  STORE r5, r11
  ADD r5, r5, r7
  LDI r11, 0xFF4400
  STORE r5, r11
  ADD r5, r5, r7
  LDI r11, 0xFF4400
  STORE r5, r11
  ADD r5, r5, r7
  LDI r11, 0x000066
  STORE r5, r11
  ADD r5, r5, r7
  LDI r11, 0x8800FF
  STORE r5, r11
  ADD r5, r5, r7
  LDI r11, 0x880088
  STORE r5, r11
  ADD r5, r5, r7
  LDI r11, 0x000000
  STORE r5, r11
  ADD r5, r5, r7
  LDI r11, 0x008888
  STORE r5, r11
  ADD r5, r5, r7
  LDI r11, 0x00FF00
  STORE r5, r11
  ADD r5, r5, r7
  LDI r11, 0xDD0044
  STORE r5, r11
  ADD r5, r5, r7
  LDI r11, 0xFFFFFF
  STORE r5, r11
  ADD r5, r5, r7
  LDI r11, 0x550077
  STORE r5, r11
  ADD r5, r5, r7
  LDI r11, 0x00AAFF
  STORE r5, r11
  ADD r5, r5, r7
  LDI r11, 0x8800FF
  STORE r5, r11
  ADD r5, r5, r7
  LDI r11, 0x008888
  STORE r5, r11
  ADD r5, r5, r7
  OR r5, r7, r31
  OR r2, r8, r6
  XOR r0, r14, r7
  CMPI r0, 0x74D8BA
  CMP r4, r0
  XOR r0, r10, r12
  HALT
