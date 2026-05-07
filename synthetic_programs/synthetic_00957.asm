; mixed program
; initialization
  LDI r11, 1
  LDI r3, 0
  LDI r15, 3739
  LDI r5, 8
  LDI r0, 0xA9A9FA
; palette
  LDI r4, 0x20B3
  LDI r24, 1
  LDI r0, 0xDD0044
  STORE r4, r0
  ADD r4, r4, r24
  LDI r0, 0xFFFFFF
  STORE r4, r0
  ADD r4, r4, r24
  LDI r0, 0xFF0000
  STORE r4, r0
  ADD r4, r4, r24
  LDI r0, 0x000000
  STORE r4, r0
  ADD r4, r4, r24
  LDI r0, 0x0044FF
  STORE r4, r0
  ADD r4, r4, r24
  LDI r0, 0xFFFFFF
  STORE r4, r0
  ADD r4, r4, r24
  LDI r0, 0xAAFF00
  STORE r4, r0
  ADD r4, r4, r24
  LDI r0, 0x000000
  STORE r4, r0
  ADD r4, r4, r24
  LDI r0, 0xDD0044
  STORE r4, r0
  ADD r4, r4, r24
  LDI r0, 0x0044FF
  STORE r4, r0
  ADD r4, r4, r24
  LDI r0, 0xFF0000
  STORE r4, r0
  ADD r4, r4, r24
  LDI r0, 0x008888
  STORE r4, r0
  ADD r4, r4, r24
  LDI r7, 0x141559
  LDI r4, 128
  LDI r3, 1856
  WPIXEL
  IKEY r15
  CMPI r15, 243
  JNZ r15, key_0
  SHR r5, r6, r15
  SHLI r4, r6, 1
  CMPI r15, 0x6EDBAD
  HALT
