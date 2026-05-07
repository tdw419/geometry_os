; drawing loop program
; initialization
  LDI r5, 8
  LDI r4, 1
  LDI r3, 2430
  LDI r1, 64
  LDI r2, 8
  LDI r15, 0x6AED77
  LDI r0, 1
; palette
  LDI r4, 0x70C7
  LDI r9, 1
  LDI r10, 0xAA00AA
  STORE r4, r10
  ADD r4, r4, r9
  LDI r10, 0x0044FF
  STORE r4, r10
  ADD r4, r4, r9
  LDI r10, 0x0000FF
  STORE r4, r10
  ADD r4, r4, r9
  LDI r10, 0x008888
  STORE r4, r10
  ADD r4, r4, r9
  LDI r10, 0xAAAAAA
  STORE r4, r10
  ADD r4, r4, r9
main_0:
  CMPI r14, 183
  XOR r1, r7, r8
  OR r2, r8, r5
  OR r0, r11, r21
  XOR r3, r0, r13
  SAR r8, r23, r6
  SHR r14, r7, r4
  SAR r29, r10, r11
  SAR r4, r13, r9
  FRAME
  JMP main_0
