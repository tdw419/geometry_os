; mixed program
; initialization
  LDI r14, 16
  LDI r8, 2790
  LDI r3, 0x4EBE03
  LDI r7, 3322
  LDI r10, 673
; palette
  LDI r5, 0x249E
  LDI r8, 1
  LDI r4, 0xFFFF00
  STORE r5, r4
  ADD r5, r5, r8
  LDI r4, 0x8800FF
  STORE r5, r4
  ADD r5, r5, r8
  LDI r4, 0xAAFF00
  STORE r5, r4
  ADD r5, r5, r8
  LDI r4, 0x00FF44
  STORE r5, r4
  ADD r5, r5, r8
  LDI r4, 0xFF0000
  STORE r5, r4
  ADD r5, r5, r8
  LDI r4, 0x00FF44
  STORE r5, r4
  ADD r5, r5, r8
  LDI r4, 0x00AAFF
  STORE r5, r4
  ADD r5, r5, r8
  LDI r4, 0xFF8800
  STORE r5, r4
  ADD r5, r5, r8
  LDI r4, 0x0044FF
  STORE r5, r4
  ADD r5, r5, r8
  LDI r4, 0x880088
  STORE r5, r4
  ADD r5, r5, r8
  LDI r4, 0x0044FF
  STORE r5, r4
  ADD r5, r5, r8
  LDI r4, 0x00FFFF
  STORE r5, r4
  ADD r5, r5, r8
  LDI r4, 0x000066
  STORE r5, r4
  ADD r5, r5, r8
  LDI r4, 0x444444
  STORE r5, r4
  ADD r5, r5, r8
  LDI r4, 0x0044FF
  STORE r5, r4
  ADD r5, r5, r8
  OR r13, r5, r7
  OR r18, r15, r13
  OR r6, r15, r4
  XOR r10, r4, r7
  SHLI r7, r3, 0xE7A7A6
  SHLI r11, r4, 0x55FED7
  LDI r6, 8
  STORE r6, r4
  LOAD r26, r6
  LDI r0, 1760
  STORE r0, r1
  LOAD r14, r0
  LDI r7, 32
  STORE r7, r12
  LOAD r1, r7
  CMPI r15, 0xA78A93
main_0:
  SHR r7, r18, r21
  SHR r2, r11, r0
  SHLI r9, r12, 0
  SHL r12, r5, r15
  SAR r4, r1, r8
  FRAME
  JMP main_0
