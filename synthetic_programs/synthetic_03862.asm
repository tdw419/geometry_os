; mixed program
; initialization
  LDI r5, 1
  LDI r10, 3542
  LDI r30, 1
  LDI r7, 0x09C8DF
  LDI r8, 0x36F105
; palette
  LDI r0, 0x22EF
  LDI r2, 1
  LDI r11, 0x000066
  STORE r0, r11
  ADD r0, r0, r2
  LDI r11, 0x000000
  STORE r0, r11
  ADD r0, r0, r2
  LDI r11, 0xFFFF00
  STORE r0, r11
  ADD r0, r0, r2
  LDI r11, 0x000066
  STORE r0, r11
  ADD r0, r0, r2
  LDI r11, 0x888800
  STORE r0, r11
  ADD r0, r0, r2
  LDI r11, 0x00FF44
  STORE r0, r11
  ADD r0, r0, r2
  LDI r11, 0xFFFFFF
  STORE r0, r11
  ADD r0, r0, r2
  LDI r11, 0x008888
  STORE r0, r11
  ADD r0, r0, r2
  LDI r11, 0xAAFF00
  STORE r0, r11
  ADD r0, r0, r2
  LDI r11, 0x44FF00
  STORE r0, r11
  ADD r0, r0, r2
  LDI r11, 0xFFFF00
  STORE r0, r11
  ADD r0, r0, r2
  LDI r11, 0x000066
  STORE r0, r11
  ADD r0, r0, r2
  LDI r11, 0x0000FF
  STORE r0, r11
  ADD r0, r0, r2
  SHL r1, r6, r3
  LDI r21, 0x336ED6
  LDI r15, 2957
  LDI r11, 3937
  LDI r13, 730
  LDI r14, 273
  LINE r21, r15, r11, r13, r14
  LDI r10, 0xD666D3
  FILL r10
  LDI r15, 255
  STORE r15, r15
  LOAD r9, r15
  LDI r26, 0x09A260
  STORE r26, r12
  LOAD r14, r26
  LDI r6, 0x5A118E
  STORE r6, r9
  LOAD r15, r6
  LDI r9, 560x70ED
  STORE r9, r12
  LOAD r6, r9
  LDI r8, 4
  STORE r8, r6
  LOAD r0, r8
  LDI r5, 10
  STORE r5, r4
  LOAD r12, r5
  CMPI r4, 1
  LDI r6, 2
  LDI r3, 16
  LDI r5, 2
  DRAWTEXT r6, r3, r5, "WORLD"
  SHR r14, r13, r8
  HALT
