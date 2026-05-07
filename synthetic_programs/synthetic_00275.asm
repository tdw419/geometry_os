; memory operations
; initialization
  LDI r15, 2
  LDI r13, 2243
  LDI r6, 2838
  LDI r8, 1
  LDI r5, 2
  STORE r5, r13
  LOAD r8, r5
  LDI r7, 999
  STORE r7, r2
  LOAD r5, r7
  LDI r5, 0x5C1C34
  STORE r5, r11
  LOAD r14, r5
  LDI r0, 0x50DB3E
  STORE r0, r15
  LOAD r4, r0
  LDI r2, 0x9737A3
  STORE r2, r5
  LOAD r12, r2
  LDI r7, 2307
  STORE r7, r6
  LOAD r8, r7
  HALT
