; stack save/restore
; initialization
  LDI r12, 8
  LDI r4, 3077
  LDI r7, 3343
  LDI r2, 1590
  LDI r9, 0x2EBFC1
  LDI r13, 255
  LDI r0, 2849
  LDI r1, 10
  PUSH r21
  AND r21, r13, r9
  SHL r7, r0, r15
  ADD r3, r9, r8
  POP r21
  DIV r10, r9, r13
  AND r8, r26, r7
  AND r15, r4, r2
  SUB r8, r9, r10
  DIV r4, r13, r15
  PUSH r3
  SHL r6, r2, r13
  MOD r1, r10, r11
  AND r2, r5, r7
  POP r3
  HALT
