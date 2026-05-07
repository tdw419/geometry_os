; drawing loop program
; initialization
  LDI r6, 688
  LDI r4, 0xEEB7BE
; palette
  LDI r7, 0x606F
  LDI r13, 1
  LDI r10, 0x888800
  STORE r7, r10
  ADD r7, r7, r13
  LDI r10, 0xFF0000
  STORE r7, r10
  ADD r7, r7, r13
  LDI r10, 0xFFFFFF
  STORE r7, r10
  ADD r7, r7, r13
  LDI r10, 0xFFFFFF
  STORE r7, r10
  ADD r7, r7, r13
  LDI r10, 0x444444
  STORE r7, r10
  ADD r7, r7, r13
  LDI r10, 0xAAFF00
  STORE r7, r10
  ADD r7, r7, r13
  LDI r10, 0x8800FF
  STORE r7, r10
  ADD r7, r7, r13
  LDI r10, 0xFFFFFF
  STORE r7, r10
  ADD r7, r7, r13
  LDI r10, 0xFF8800
  STORE r7, r10
  ADD r7, r7, r13
  LDI r10, 0x00FF44
  STORE r7, r10
  ADD r7, r7, r13
  LDI r10, 0x000000
  STORE r7, r10
  ADD r7, r7, r13
  LDI r10, 0x8800FF
  STORE r7, r10
  ADD r7, r7, r13
  LDI r10, 0xFFAA00
  STORE r7, r10
  ADD r7, r7, r13
  LDI r10, 0x00FF44
  STORE r7, r10
  ADD r7, r7, r13
  LDI r10, 0x44FF00
  STORE r7, r10
  ADD r7, r7, r13
main_0:
  SAR r12, r6, r2
  SHR r2, r7, r1
  SHR r15, r8, r4
  AND r6, r5, r3
  OR r10, r2, r14
  LDI r2, 0x3B3AA9
  LDI r2, 10
  LDI r15, 2835
  TEXT r2, r2, r15, "HELLO"
  FRAME
  JMP main_0
