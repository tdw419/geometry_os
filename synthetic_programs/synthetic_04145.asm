; mixed program
; initialization
  LDI r14, 3696
  LDI r13, 441
  LDI r0, 0x599D18
; palette
  LDI r11, 0x21E6
  LDI r13, 1
  LDI r8, 0x888800
  STORE r11, r8
  ADD r11, r11, r13
  LDI r8, 0x000000
  STORE r11, r8
  ADD r11, r11, r13
  LDI r8, 0x00FF00
  STORE r11, r8
  ADD r11, r11, r13
  LDI r8, 0xFF00FF
  STORE r11, r8
  ADD r11, r11, r13
  LDI r8, 0xFF8800
  STORE r11, r8
  ADD r11, r11, r13
  LDI r8, 0xFFFF00
  STORE r11, r8
  ADD r11, r11, r13
  LDI r8, 0x00FF44
  STORE r11, r8
  ADD r11, r11, r13
  LDI r8, 0x00FF44
  STORE r11, r8
  ADD r11, r11, r13
  LDI r8, 0x0044FF
  STORE r11, r8
  ADD r11, r11, r13
  LDI r8, 0xFFFFFF
  STORE r11, r8
  ADD r11, r11, r13
  LDI r8, 0xFF0000
  STORE r11, r8
  ADD r11, r11, r13
  LDI r8, 0xFF0000
  STORE r11, r8
  ADD r11, r11, r13
  LDI r8, 0x00FF44
  STORE r11, r8
  ADD r11, r11, r13
  LDI r8, 0x00FFFF
  STORE r11, r8
  ADD r11, r11, r13
  LDI r8, 0x008888
  STORE r11, r8
  ADD r11, r11, r13
  SHR r20, r6, r16
  SAR r7, r27, r6
  SHR r6, r10, r14
  LDI r13, 0x55546D
  STORE r13, r0
  LOAD r3, r13
  LDI r14, 128
  STORE r14, r10
  LOAD r7, r14
  LDI r2, 182
  STORE r2, r4
  LOAD r8, r2
  LDI r3, 109
  STORE r3, r3
  LOAD r13, r3
  LDI r3, 0xB42675
  STORE r3, r12
  LOAD r7, r3
  AND r9, r0, r6
  HALT
