; stack save/restore
; initialization
  LDI r15, 1299
  LDI r8, 1214
  LDI r9, 216
  LDI r10, 3063
  LDI r30, 2932
  LDI r0, 3363
  LDI r2, 2394
  LDI r1, 0x4283EA
  PUSH r7
  AND r7, r14, r13
  MOD r9, r2, r14
  POP r7
  XOR r5, r12, r1
  MUL r3, r5, r7
  ADD r15, r6, r3
  MOD r1, r3, r7
  MOD r15, r6, r0
  MUL r8, r2, r4
  PUSH r7
  PUSH r8
  PUSH r4
  PUSH r1
  AND r28, r7, r8
  AND r7, r4, r1
  POP r1
  POP r4
  POP r8
  POP r7
  HALT
