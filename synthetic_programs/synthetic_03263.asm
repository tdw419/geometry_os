; mixed program
; initialization
  LDI r14, 32
  LDI r8, 16
  LDI r7, 8
  LDI r0, 164
; palette
  LDI r14, 0x23CB
  LDI r2, 1
  LDI r4, 0x008888
  STORE r14, r4
  ADD r14, r14, r2
  LDI r4, 0xAA00AA
  STORE r14, r4
  ADD r14, r14, r2
  LDI r4, 0x888800
  STORE r14, r4
  ADD r14, r14, r2
  LDI r4, 0x0044FF
  STORE r14, r4
  ADD r14, r14, r2
  LDI r4, 0x000000
  STORE r14, r4
  ADD r14, r14, r2
  LDI r4, 0x880088
  STORE r14, r4
  ADD r14, r14, r2
  LDI r4, 0x888800
  STORE r14, r4
  ADD r14, r14, r2
  LDI r4, 0xFFAA00
  STORE r14, r4
  ADD r14, r14, r2
  LDI r4, 0x00FFAA
  STORE r14, r4
  ADD r14, r14, r2
  PUSH r10
  PUSH r25
  MOD r15, r7, r10
  SHL r9, r0, r2
  SHR r7, r4, r2
  SUB r13, r12, r6
  POP r25
  POP r10
  CMPI r13, 0x0EFC49
  CMP r2, r13
  LDI r10, 2055
  STORE r10, r8
  LOAD r30, r10
  LDI r14, 32
  STORE r14, r0
  LOAD r15, r14
  HALT
