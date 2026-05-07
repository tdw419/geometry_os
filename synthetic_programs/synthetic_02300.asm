; drawing loop program
; initialization
  LDI r0, 128
  LDI r3, 10
  LDI r9, 3217
  LDI r1, 0x78D82F
; palette
  LDI r0, 0x6058
  LDI r5, 1
  LDI r2, 0x880088
  STORE r0, r2
  ADD r0, r0, r5
  LDI r2, 0x8800FF
  STORE r0, r2
  ADD r0, r0, r5
  LDI r2, 0x0000CC
  STORE r0, r2
  ADD r0, r0, r5
  LDI r2, 0x008888
  STORE r0, r2
  ADD r0, r0, r5
  LDI r2, 0xFFEE00
  STORE r0, r2
  ADD r0, r0, r5
  LDI r2, 0xFFFF00
  STORE r0, r2
  ADD r0, r0, r5
  LDI r2, 0x444444
  STORE r0, r2
  ADD r0, r0, r5
  LDI r2, 0x444444
  STORE r0, r2
  ADD r0, r0, r5
  LDI r2, 0x00FF00
  STORE r0, r2
  ADD r0, r0, r5
main_0:
  LDI r12, 32
  LDI r15, 0x0BF291
  LDI r2, 4
  PSET r12, r15, r2
  SUBI r1, r3, 81
  SUB r14, r13, r6
  CMP r4, r1
  LDI r1, 0
  LDI r3, 256
  LDI r11, 0xB68835
  LDI r5, 1
  CIRCLE r1, r3, r11, r5
  SHLI r6, r14, 0x1AD09A
  SHLI r11, r4, 0xA70103
  SHL r0, r3, r13
  FRAME
  JMP main_0
