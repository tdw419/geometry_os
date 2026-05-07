; simple draw program
; initialization
  LDI r7, 2
  LDI r10, 0x73DCD9
  LDI r4, 0xC8FECC
  LDI r12, 0x117F1F
  LDI r13, 1
  LDI r2, 2
  LDI r0, 60
  LDI r28, 1505
  PSETI
  LDI r15, 0xFCA4E4
  LDI r6, 0xE92AB9
  LDI r5, 255
  PSET r15, r6, r5
  LDI r0, 2343
  LDI r14, 32
  LDI r5, 0xEECD76
  LDI r6, 0x7A348A
  LDI r8, 0x4CE32C
  RECTF r0, r14, r5, r6, r8
  HALT
