; drawing loop program
; initialization
  LDI r3, 0x2215A7
  LDI r2, 1250
  LDI r14, 0x68BAA3
  LDI r4, 0x35D6C6
  LDI r10, 0x0BE766
  LDI r15, 16
  LDI r8, 2122
  LDI r1, 32
; palette
  LDI r15, 0x24CB
  LDI r9, 1
  LDI r3, 0x0000FF
  STORE r15, r3
  ADD r15, r15, r9
  LDI r3, 0x0044FF
  STORE r15, r3
  ADD r15, r15, r9
  LDI r3, 0xFFEE00
  STORE r15, r3
  ADD r15, r15, r9
  LDI r3, 0x000000
  STORE r15, r3
  ADD r15, r15, r9
  LDI r3, 0xFFAA00
  STORE r15, r3
  ADD r15, r15, r9
  LDI r3, 0x0000FF
  STORE r15, r3
  ADD r15, r15, r9
  LDI r3, 0x44FF00
  STORE r15, r3
  ADD r15, r15, r9
  LDI r3, 0x0000CC
  STORE r15, r3
  ADD r15, r15, r9
  LDI r3, 0xFFAA00
  STORE r15, r3
  ADD r15, r15, r9
  LDI r3, 0x0000CC
  STORE r15, r3
  ADD r15, r15, r9
main_0:
  LDI r4, 0xF6230B
  LDI r11, 0x562B36
  LDI r9, 2476
  LDI r5, 8
  LDI r13, 0
  LINE r4, r11, r9, r5, r13
  MOD r1, r13, r6
  SAR r1, r9, r11
  SHLI r3, r8, 7
  SHR r12, r8, r1
  SHLI r5, r14, 0xFB27FD
  SHL r11, r0, r1
  SHL r9, r5, r12
  SHR r12, r1, r13
  SHL r0, r4, r10
  LDI r12, 936
  LDI r15, 0xE64453
  LDI r5, 128
  DRAWTEXT r12, r15, r5, "WORLD"
  SUBI r9, r1, 32
  FRAME
  JMP main_0
