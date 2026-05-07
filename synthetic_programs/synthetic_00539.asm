; stack save/restore
; initialization
  LDI r12, 2654
  LDI r8, 0
  LDI r10, 255
  PUSH r10
  PUSH r13
  ADD r15, r20, r10
  SUB r23, r10, r2
  ADD r12, r13, r7
  POP r13
  POP r10
  MOD r15, r10, r9
  SHL r5, r8, r3
  AND r10, r15, r25
  DIV r20, r4, r14
  SHL r14, r1, r2
  PUSH r3
  SUB r5, r7, r12
  DIV r15, r12, r10
  OR r2, r8, r15
  POP r3
  HALT
