; mixed program
; initialization
  LDI r9, 2
  LDI r5, 0x2EA58D
  LDI r7, 32
  LDI r3, 251
  LDI r6, 128
  LDI r2, 3883
  LDI r1, 2
  LDI r10, 3322
; palette
  LDI r14, 0x803E
  LDI r12, 1
  LDI r3, 0xFFEE00
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0xFFFFFF
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0xFFEE00
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0xFFEE00
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0xAAAAAA
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0x0044FF
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0x880088
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0x000000
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0xFFFFFF
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0x00AAFF
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0x000066
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0x550077
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0x550077
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0xAAAAAA
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0xDD0044
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 1
  LDI r3, 8
  LDI r0, 0xACD7A1
  TEXT r3, r3, r0, "HELLO"
  LDI r5, 0x4D088C
  STORE r5, r12
  LOAD r16, r5
  LDI r0, 518
  STORE r0, r14
  LOAD r2, r0
  MOD r3, r8, r6
  IKEY r2
  CMPI r2, 10
  JNZ r2, key_0
main_1:
  LDI r0, 0x316B14
  LDI r14, 1382
  LDI r31, 4094
  TEXT r0, r14, r31, "HELLO"
  IKEY r8
  CMPI r8, 162
  JNZ r8, key_2
  LDI r17, 2630
  LDI r10, 2399
  LDI r8, 3654
  PSET r17, r10, r8
  MOD r14, r3, r6
  FRAME
  JMP main_1
