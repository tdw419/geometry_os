; mixed program
; initialization
  LDI r9, 174
  LDI r2, 0x23DB55
  LDI r10, 1954
; palette
  LDI r12, 0x500B
  LDI r14, 1
  LDI r10, 0x0000FF
  STORE r12, r10
  ADD r12, r12, r14
  LDI r10, 0x0044FF
  STORE r12, r10
  ADD r12, r12, r14
  LDI r10, 0x0000FF
  STORE r12, r10
  ADD r12, r12, r14
  LDI r10, 0xFF8800
  STORE r12, r10
  ADD r12, r12, r14
  LDI r10, 0xFFFF00
  STORE r12, r10
  ADD r12, r12, r14
  LDI r10, 0xAAAAAA
  STORE r12, r10
  ADD r12, r12, r14
  LDI r10, 0xFF0000
  STORE r12, r10
  ADD r12, r12, r14
  LDI r10, 0x44FF00
  STORE r12, r10
  ADD r12, r12, r14
  LDI r10, 0x44FF00
  STORE r12, r10
  ADD r12, r12, r14
  LDI r10, 0xDD0044
  STORE r12, r10
  ADD r12, r12, r14
  LDI r10, 0xFFAA00
  STORE r12, r10
  ADD r12, r12, r14
  LDI r10, 0xFFAA00
  STORE r12, r10
  ADD r12, r12, r14
  LDI r10, 0x000000
  STORE r12, r10
  ADD r12, r12, r14
  LDI r10, 0xDD0044
  STORE r12, r10
  ADD r12, r12, r14
  LDI r10, 0xFFFFFF
  STORE r12, r10
  ADD r12, r12, r14
  LDI r10, 0x00FFAA
  STORE r12, r10
  ADD r12, r12, r14
  LDI r0, 2
  LDI r14, 8
  LDI r1, 16
  PSET r0, r14, r1
  IKEY r13
  CMPI r13, 256
  JNZ r13, key_0
  AND r5, r11, r13
  OR r11, r4, r3
  AND r10, r8, r15
  PUSH r1
  PUSH r7
  MOD r14, r8, r9
  ADD r13, r6, r4
  SHL r4, r14, r12
  AND r4, r12, r11
  POP r7
  POP r1
  HALT
