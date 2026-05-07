; drawing loop program
; initialization
  LDI r10, 2
  LDI r9, 0x6000C2
  LDI r1, 256
  LDI r8, 3605
  LDI r12, 16
  LDI r0, 0xE7AC02
; palette
  LDI r2, 0x216C
  LDI r4, 1
  LDI r10, 0x550077
  STORE r2, r10
  ADD r2, r2, r4
  LDI r10, 0xDD0044
  STORE r2, r10
  ADD r2, r2, r4
  LDI r10, 0xFFAA00
  STORE r2, r10
  ADD r2, r2, r4
  LDI r10, 0x550077
  STORE r2, r10
  ADD r2, r2, r4
  LDI r10, 0x888800
  STORE r2, r10
  ADD r2, r2, r4
  LDI r10, 0xFF00FF
  STORE r2, r10
  ADD r2, r2, r4
  LDI r10, 0xFFFF00
  STORE r2, r10
  ADD r2, r2, r4
  LDI r10, 0xFF8800
  STORE r2, r10
  ADD r2, r2, r4
  LDI r10, 0x008888
  STORE r2, r10
  ADD r2, r2, r4
  LDI r10, 0x00FF00
  STORE r2, r10
  ADD r2, r2, r4
  LDI r10, 0xFF0000
  STORE r2, r10
  ADD r2, r2, r4
  LDI r10, 0xFF4400
  STORE r2, r10
  ADD r2, r2, r4
main_0:
  ANDI r1, r7, 50
  SAR r6, r22, r9
  SAR r10, r0, r11
  SHR r8, r17, r7
  LDI r9, 0x79BC4D
  LDI r13, 0x4225BF
  LDI r1, 4
  TEXT r9, r13, r1, "HELLO"
  SHL r0, r7, r14
  SHR r13, r5, r3
  IKEY r15
  CMPI r15, 0xC3E807
  JNZ r15, key_1
  FRAME
  JMP main_0
