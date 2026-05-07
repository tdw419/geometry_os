; stack save/restore
; initialization
  LDI r2, 2209
  LDI r0, 0x4C3E0A
  PUSH r10
  PUSH r2
  PUSH r9
  AND r10, r4, r14
  MOD r2, r3, r5
  POP r9
  POP r2
  POP r10
  ADD r6, r1, r2
  MUL r29, r27, r12
  OR r10, r12, r8
  ADD r4, r12, r8
  PUSH r14
  PUSH r9
  ADD r15, r1, r7
  AND r15, r9, r0
  OR r3, r12, r1
  DIV r5, r0, r8
  SHL r0, r13, r15
  POP r9
  POP r14
  HALT
