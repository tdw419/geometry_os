; drawing loop program
; initialization
  LDI r5, 3786
  LDI r6, 1052
  LDI r1, 0x2E8403
; palette
  LDI r4, 0x23DB
  LDI r3, 1
  LDI r29, 0x8800FF
  STORE r4, r29
  ADD r4, r4, r3
  LDI r29, 0xDD0044
  STORE r4, r29
  ADD r4, r4, r3
  LDI r29, 0xAAAAAA
  STORE r4, r29
  ADD r4, r4, r3
  LDI r29, 0x0000FF
  STORE r4, r29
  ADD r4, r4, r3
  LDI r29, 0x000000
  STORE r4, r29
  ADD r4, r4, r3
  LDI r29, 0x8800FF
  STORE r4, r29
  ADD r4, r4, r3
  LDI r29, 0x0000FF
  STORE r4, r29
  ADD r4, r4, r3
  LDI r29, 0xFFAA00
  STORE r4, r29
  ADD r4, r4, r3
  LDI r29, 0xFF8800
  STORE r4, r29
  ADD r4, r4, r3
  LDI r29, 0x0044FF
  STORE r4, r29
  ADD r4, r4, r3
  LDI r29, 0xFFFFFF
  STORE r4, r29
  ADD r4, r4, r3
  LDI r29, 0x008888
  STORE r4, r29
  ADD r4, r4, r3
main_0:
  SUBI r13, r3, 2
  XOR r15, r13, r9
  OR r15, r3, r10
  LDI r9, 0x77EA8B
  LDI r4, 2
  LDI r0, 256
  DRAWTEXT r9, r4, r0, "WORLD"
  CMPI r3, 0xC0D053
  LDI r12, 16
  LDI r0, 0x53CA6F
  LDI r14, 0xBDA797
  PSETI
  FRAME
  JMP main_0
