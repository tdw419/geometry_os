; drawing loop program
; initialization
  LDI r0, 3558
  LDI r13, 2760
  LDI r6, 0x81D291
  LDI r1, 0xB3765E
  LDI r5, 2960
  LDI r8, 0xA6B5D1
; palette
  LDI r2, 0x21E9
  LDI r9, 1
  LDI r10, 0x0000CC
  STORE r2, r10
  ADD r2, r2, r9
  LDI r10, 0x008888
  STORE r2, r10
  ADD r2, r2, r9
  LDI r10, 0x0000FF
  STORE r2, r10
  ADD r2, r2, r9
  LDI r10, 0xFF4400
  STORE r2, r10
  ADD r2, r2, r9
  LDI r10, 0x0044FF
  STORE r2, r10
  ADD r2, r2, r9
  LDI r10, 0x000000
  STORE r2, r10
  ADD r2, r2, r9
  LDI r10, 0x000000
  STORE r2, r10
  ADD r2, r2, r9
  LDI r10, 0x000000
  STORE r2, r10
  ADD r2, r2, r9
  LDI r10, 0x00FF44
  STORE r2, r10
  ADD r2, r2, r9
  LDI r10, 0xFFFF00
  STORE r2, r10
  ADD r2, r2, r9
  LDI r10, 0xFFFF00
  STORE r2, r10
  ADD r2, r2, r9
  LDI r10, 0x8800FF
  STORE r2, r10
  ADD r2, r2, r9
  LDI r10, 0x00FF44
  STORE r2, r10
  ADD r2, r2, r9
main_0:
  SHL r13, r7, r5
  SHL r7, r5, r4
  CMPI r5, r7, 256
  IKEY r11
  CMPI r11, 88
  JNZ r11, key_1
  SHR r0, r7, r9
  SHL r13, r15, r7
  SAR r5, r15, r13
  SHL r23, r3, r6
  FRAME
  JMP main_0
