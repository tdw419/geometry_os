; drawing loop program
; initialization
  LDI r5, 2
  LDI r1, 4020
; palette
  LDI r22, 0x304D
  LDI r12, 1
  LDI r4, 0x0000CC
  STORE r22, r4
  ADD r22, r22, r12
  LDI r4, 0x000000
  STORE r22, r4
  ADD r22, r22, r12
  LDI r4, 0xDD0044
  STORE r22, r4
  ADD r22, r22, r12
  LDI r4, 0xFFFFFF
  STORE r22, r4
  ADD r22, r22, r12
  LDI r4, 0x0044FF
  STORE r22, r4
  ADD r22, r22, r12
  LDI r4, 0xAAAAAA
  STORE r22, r4
  ADD r22, r22, r12
  LDI r4, 0x880088
  STORE r22, r4
  ADD r22, r22, r12
  LDI r4, 0x444444
  STORE r22, r4
  ADD r22, r22, r12
  LDI r4, 0x0000CC
  STORE r22, r4
  ADD r22, r22, r12
  LDI r4, 0x444444
  STORE r22, r4
  ADD r22, r22, r12
  LDI r4, 0xFFAA00
  STORE r22, r4
  ADD r22, r22, r12
  LDI r4, 0x00FF00
  STORE r22, r4
  ADD r22, r22, r12
  LDI r4, 0xFF4400
  STORE r22, r4
  ADD r22, r22, r12
  LDI r4, 0x008888
  STORE r22, r4
  ADD r22, r22, r12
  LDI r4, 0xFFFF00
  STORE r22, r4
  ADD r22, r22, r12
main_0:
  IKEY r10
  CMPI r10, 128
  JNZ r10, key_1
  OR r12, r14, r10
  AND r0, r12, r3
  FRAME
  JMP main_0
