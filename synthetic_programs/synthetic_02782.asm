; drawing loop program
; initialization
  LDI r11, 8
  LDI r12, 214
  LDI r26, 0xBB16E4
  LDI r13, 128
  LDI r10, 955
  LDI r14, 0xD03CDE
  LDI r15, 406
; palette
  LDI r3, 0x40EF
  LDI r11, 1
  LDI r9, 0xDD0044
  STORE r3, r9
  ADD r3, r3, r11
  LDI r9, 0x008888
  STORE r3, r9
  ADD r3, r3, r11
  LDI r9, 0xDD0044
  STORE r3, r9
  ADD r3, r3, r11
  LDI r9, 0x000066
  STORE r3, r9
  ADD r3, r3, r11
  LDI r9, 0xAA00AA
  STORE r3, r9
  ADD r3, r3, r11
  LDI r9, 0x00FF44
  STORE r3, r9
  ADD r3, r3, r11
  LDI r9, 0x00FF00
  STORE r3, r9
  ADD r3, r3, r11
  LDI r9, 0xAAFF00
  STORE r3, r9
  ADD r3, r3, r11
  LDI r9, 0x444444
  STORE r3, r9
  ADD r3, r3, r11
  LDI r9, 0xFF0000
  STORE r3, r9
  ADD r3, r3, r11
  LDI r9, 0xFF00FF
  STORE r3, r9
  ADD r3, r3, r11
  LDI r9, 0x880088
  STORE r3, r9
  ADD r3, r3, r11
  LDI r9, 0x00FF44
  STORE r3, r9
  ADD r3, r3, r11
  LDI r9, 0xFF0000
  STORE r3, r9
  ADD r3, r3, r11
  LDI r9, 0x000066
  STORE r3, r9
  ADD r3, r3, r11
  LDI r9, 0x888800
  STORE r3, r9
  ADD r3, r3, r11
main_0:
  LDI r13, 3877
  LDI r3, 3253
  LDI r6, 1
  PSET r13, r3, r6
  SHL r15, r3, r4
  IKEY r14
  CMPI r14, 4
  JNZ r14, key_1
  IKEY r4
  CMPI r4, 0x2C3CE7
  JNZ r4, key_2
  LDI r11, 0x4170F3
  LDI r10, 4
  LDI r10, 4
  TEXT r11, r10, r10, "HELLO"
  SHLI r3, r7, 4
  SAR r9, r15, r14
  FRAME
  JMP main_0
