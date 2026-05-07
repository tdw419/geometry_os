; mixed program
; initialization
  LDI r8, 0x2C4979
  LDI r1, 0x9B8DA9
  SHR r12, r14, r9
  SHLI r12, r14, 6
  PUSH r1
  PUSH r10
  PUSH r13
  MOD r5, r1, r8
  ADD r10, r0, r1
  DIV r3, r2, r1
  ADD r10, r13, r7
  POP r13
  POP r10
  POP r1
  LDI r4, 0x476749
  STORE r4, r9
  LOAD r1, r4
  LDI r8, 538
  STORE r8, r12
  LOAD r0, r8
  LDI r12, 785
  STORE r12, r9
  LOAD r6, r12
  HALT
