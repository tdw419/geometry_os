; memory operations
; initialization
  LDI r14, 0xBA5072
  LDI r7, 0
  LDI r6, 0xF66F83
  LDI r23, 575
  LDI r2, 1
  STORE r2, r6
  LOAD r9, r2
  LDI r10, 256
  STORE r10, r6
  LOAD r11, r10
  LDI r12, 0x609C
  STORE r12, r20
  LOAD r5, r12
  LDI r4, 0
  STORE r4, r8
  LOAD r10, r4
  LDI r12, 0xA5F015
  STORE r12, r30
  LOAD r15, r12
  HALT
