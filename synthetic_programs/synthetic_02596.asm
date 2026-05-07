; mixed program
; initialization
  LDI r8, 0x09DEA3
  LDI r12, 0xD89FD3
  LDI r2, 1414
  LDI r13, 1328
  LDI r0, 2744
; palette
  LDI r15, 0x40FE
  LDI r5, 1
  LDI r8, 0xFFFFFF
  STORE r15, r8
  ADD r15, r15, r5
  LDI r8, 0x550077
  STORE r15, r8
  ADD r15, r15, r5
  LDI r8, 0xFFFFFF
  STORE r15, r8
  ADD r15, r15, r5
  LDI r8, 0x444444
  STORE r15, r8
  ADD r15, r15, r5
  LDI r8, 0x000066
  STORE r15, r8
  ADD r15, r15, r5
  LDI r8, 0x0044FF
  STORE r15, r8
  ADD r15, r15, r5
  LDI r8, 0xAA00AA
  STORE r15, r8
  ADD r15, r15, r5
  LDI r8, 0x8800FF
  STORE r15, r8
  ADD r15, r15, r5
  LDI r8, 0x0044FF
  STORE r15, r8
  ADD r15, r15, r5
  LDI r8, 0xAA00AA
  STORE r15, r8
  ADD r15, r15, r5
  LDI r8, 0xFFFFFF
  STORE r15, r8
  ADD r15, r15, r5
  LDI r8, 0x8800FF
  STORE r15, r8
  ADD r15, r15, r5
  LDI r8, 0x000066
  STORE r15, r8
  ADD r15, r15, r5
  LDI r8, 0x0000CC
  STORE r15, r8
  ADD r15, r15, r5
  LDI r10, 0xE2B9C7
loop_0:
  CMPI r2, r8, 86
  LDI r8, 1
  SUB r10, r10, r8
  JNZ r10, loop_0
  LDI r14, 1437
  LDI r15, 4
  LDI r3, 0x04DEA9
  TEXT r14, r15, r3, "HELLO"
  LDI r12, 0
  STORE r12, r3
  LOAD r15, r12
  LDI r3, 0x3062DB
  STORE r3, r8
  LOAD r0, r3
  LDI r15, 0xFA9065
  STORE r15, r13
  LOAD r10, r15
  LDI r6, 1
  STORE r6, r11
  LOAD r5, r6
  CMPI r4, 4
  IKEY r5
  CMPI r5, 163
  JNZ r5, key_1
  HALT
