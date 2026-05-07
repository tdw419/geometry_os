; drawing loop program
; initialization
  LDI r15, 0x0EF680
  LDI r0, 2064
  LDI r14, 3618
  LDI r10, 1206
  LDI r13, 0xEAB59D
  LDI r2, 1306
  LDI r7, 2252
; palette
  LDI r6, 0x20DC
  LDI r13, 1
  LDI r14, 0xFFFF00
  STORE r6, r14
  ADD r6, r6, r13
  LDI r14, 0x00FF44
  STORE r6, r14
  ADD r6, r6, r13
  LDI r14, 0x888800
  STORE r6, r14
  ADD r6, r6, r13
  LDI r14, 0x880088
  STORE r6, r14
  ADD r6, r6, r13
  LDI r14, 0xFF4400
  STORE r6, r14
  ADD r6, r6, r13
  LDI r14, 0x0044FF
  STORE r6, r14
  ADD r6, r6, r13
  LDI r14, 0x008888
  STORE r6, r14
  ADD r6, r6, r13
main_0:
  SHR r15, r7, r3
  SAR r3, r15, r4
  SHR r13, r4, r10
  SHR r7, r3, r9
  SUBI r9, r16, 38
  ANDI r13, r30, 0x7FCDD1
  SHR r13, r4, r5
  SHR r8, r5, r14
  SHL r2, r4, r11
  SHLI r9, r19, 0
  OR r10, r15, r2
  OR r3, r13, r1
  OR r7, r9, r5
  OR r13, r12, r5
  SUBI r11, r0, 210
  FRAME
  JMP main_0
