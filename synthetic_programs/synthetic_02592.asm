; drawing loop program
; initialization
  LDI r6, 1357
  LDI r2, 64
; palette
  LDI r0, 0x209D
  LDI r8, 1
  LDI r6, 0xFF4400
  STORE r0, r6
  ADD r0, r0, r8
  LDI r6, 0x0044FF
  STORE r0, r6
  ADD r0, r0, r8
  LDI r6, 0x000066
  STORE r0, r6
  ADD r0, r0, r8
  LDI r6, 0xAAAAAA
  STORE r0, r6
  ADD r0, r0, r8
  LDI r6, 0x008888
  STORE r0, r6
  ADD r0, r0, r8
  LDI r6, 0x0044FF
  STORE r0, r6
  ADD r0, r0, r8
  LDI r6, 0x000000
  STORE r0, r6
  ADD r0, r0, r8
  LDI r6, 0xAA00AA
  STORE r0, r6
  ADD r0, r0, r8
  LDI r6, 0xFFFF00
  STORE r0, r6
  ADD r0, r0, r8
  LDI r6, 0x880088
  STORE r0, r6
  ADD r0, r0, r8
  LDI r6, 0x0044FF
  STORE r0, r6
  ADD r0, r0, r8
  LDI r6, 0x000066
  STORE r0, r6
  ADD r0, r0, r8
  LDI r6, 0x008888
  STORE r0, r6
  ADD r0, r0, r8
  LDI r6, 0xFFAA00
  STORE r0, r6
  ADD r0, r0, r8
  LDI r6, 0x888800
  STORE r0, r6
  ADD r0, r0, r8
main_0:
  LDI r9, 0x342BAE
  LDI r14, 128
  LDI r7, 0x0C2AAE
  TEXT r9, r14, r7, "HELLO"
  SHR r21, r4, r1
  ANDI r13, r15, 5
  AND r9, r5, r0
  XOR r13, r9, r12
  OR r2, r9, r5
  FRAME
  JMP main_0
