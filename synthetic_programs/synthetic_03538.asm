; drawing loop program
; initialization
  LDI r7, 359
  LDI r8, 0xEF48BA
  LDI r11, 64
  LDI r12, 0x3C445B
  LDI r5, 4
; palette
  LDI r5, 0x2496
  LDI r0, 1
  LDI r15, 0xDD0044
  STORE r5, r15
  ADD r5, r5, r0
  LDI r15, 0x0000FF
  STORE r5, r15
  ADD r5, r5, r0
  LDI r15, 0x888800
  STORE r5, r15
  ADD r5, r5, r0
  LDI r15, 0xAA00AA
  STORE r5, r15
  ADD r5, r5, r0
  LDI r15, 0x444444
  STORE r5, r15
  ADD r5, r5, r0
  LDI r15, 0x0044FF
  STORE r5, r15
  ADD r5, r5, r0
  LDI r15, 0x008888
  STORE r5, r15
  ADD r5, r5, r0
main_0:
  SHR r21, r14, r19
  SHLI r8, r7, 10
  MOD r14, r15, r19
  IKEY r1
  CMPI r1, 8
  JNZ r1, key_1
  XOR r7, r28, r29
  XOR r12, r20, r5
  OR r2, r7, r8
  FRAME
  JMP main_0
