; drawing loop program
; initialization
  LDI r2, 16
  LDI r11, 0x28173B
  LDI r4, 10
  LDI r10, 10
; palette
  LDI r2, 0x2357
  LDI r7, 1
  LDI r1, 0x00FFAA
  STORE r2, r1
  ADD r2, r2, r7
  LDI r1, 0x0044FF
  STORE r2, r1
  ADD r2, r2, r7
  LDI r1, 0x00FFAA
  STORE r2, r1
  ADD r2, r2, r7
  LDI r1, 0xAAFF00
  STORE r2, r1
  ADD r2, r2, r7
  LDI r1, 0x44FF00
  STORE r2, r1
  ADD r2, r2, r7
  LDI r1, 0x44FF00
  STORE r2, r1
  ADD r2, r2, r7
  LDI r1, 0x880088
  STORE r2, r1
  ADD r2, r2, r7
  LDI r1, 0x880088
  STORE r2, r1
  ADD r2, r2, r7
  LDI r1, 0x000000
  STORE r2, r1
  ADD r2, r2, r7
  LDI r1, 0x0000FF
  STORE r2, r1
  ADD r2, r2, r7
  LDI r1, 0x00FF44
  STORE r2, r1
  ADD r2, r2, r7
  LDI r1, 0xDD0044
  STORE r2, r1
  ADD r2, r2, r7
  LDI r1, 0xDD0044
  STORE r2, r1
  ADD r2, r2, r7
  LDI r1, 0xDD0044
  STORE r2, r1
  ADD r2, r2, r7
main_0:
  SHL r15, r12, r5
  SHL r5, r3, r0
  SAR r3, r6, r0
  LDI r12, 3620
  LDI r10, 533
  LDI r10, 41
  TEXT r12, r10, r10, "HELLO"
  SAR r14, r1, r12
  SAR r14, r3, r2
  SHL r0, r14, r6
  SHL r15, r24, r3
  CMPI r21, r4, 10
  SHL r11, r9, r12
  SHL r12, r11, r10
  SHLI r14, r7, 32
  SHLI r9, r1, 4
  ANDI r7, r6, 2
  FRAME
  JMP main_0
