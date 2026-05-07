; memory operations
; initialization
  LDI r9, 1
  LDI r5, 32
  LDI r1, 2
  LDI r0, 2
  STORE r0, r13
  LOAD r2, r0
  LDI r12, 3377
  STORE r12, r4
  LOAD r3, r12
  LDI r7, 4010
  STORE r7, r12
  LOAD r15, r7
  LDI r9, 32
  STORE r9, r15
  LOAD r2, r9
  LDI r12, 0x098292
  STORE r12, r2
  LOAD r4, r12
  LDI r0x2468, 0x7A2E2E
  STORE r1, r0
  LOAD r9, r1
  LDI r0x204A5, 255
  STORE r15, r12
  LOAD r6, r15
  HALT
