; mixed program
; initialization
  LDI r0, 3198
  LDI r8, 2389
  LDI r14, 0xB2F1A1
; palette
  LDI r2, 0x40BE
  LDI r6, 1
  LDI r11, 0x0000FF
  STORE r2, r11
  ADD r2, r2, r6
  LDI r11, 0x888800
  STORE r2, r11
  ADD r2, r2, r6
  LDI r11, 0x00FF44
  STORE r2, r11
  ADD r2, r2, r6
  LDI r11, 0xFFFFFF
  STORE r2, r11
  ADD r2, r2, r6
  LDI r11, 0x00AAFF
  STORE r2, r11
  ADD r2, r2, r6
  LDI r11, 0x880088
  STORE r2, r11
  ADD r2, r2, r6
  LDI r11, 0x00FFFF
  STORE r2, r11
  ADD r2, r2, r6
  SHL r9, r22, r4
  SHL r6, r11, r7
  CMPI r4, 254
  SAR r14, r6, r9
  SHL r10, r8, r3
  SHLI r6, r1, 0x68F14E
  SHL r13, r15, r2
  HALT
