; drawing loop program
; initialization
  LDI r10, 0x917056
  LDI r15, 10
  LDI r6, 255
  LDI r7, 0x6D23DA
  LDI r12, 3465
  LDI r14, 1167
; palette
  LDI r0, 0x24B6
  LDI r5, 1
  LDI r13, 0xFFEE00
  STORE r0, r13
  ADD r0, r0, r5
  LDI r13, 0x0044FF
  STORE r0, r13
  ADD r0, r0, r5
  LDI r13, 0xDD0044
  STORE r0, r13
  ADD r0, r0, r5
  LDI r13, 0x000066
  STORE r0, r13
  ADD r0, r0, r5
  LDI r13, 0x0000CC
  STORE r0, r13
  ADD r0, r0, r5
  LDI r13, 0xAAAAAA
  STORE r0, r13
  ADD r0, r0, r5
  LDI r13, 0xFFFFFF
  STORE r0, r13
  ADD r0, r0, r5
  LDI r13, 0xDD0044
  STORE r0, r13
  ADD r0, r0, r5
  LDI r13, 0x000000
  STORE r0, r13
  ADD r0, r0, r5
  LDI r13, 0x888800
  STORE r0, r13
  ADD r0, r0, r5
  LDI r13, 0x00FF00
  STORE r0, r13
  ADD r0, r0, r5
  LDI r13, 0xAAFF00
  STORE r0, r13
  ADD r0, r0, r5
main_0:
  XOR r1, r13, r0
  OR r15, r12, r22
  CMPI r5, 254
  SHLI r5, r15, 256
  SAR r8, r6, r4
  SHL r14, r3, r9
  SAR r8, r3, r12
  FRAME
  JMP main_0
