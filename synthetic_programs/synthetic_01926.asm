; stack save/restore
; initialization
  LDI r8, 0xA3E441
  LDI r4, 3370
  LDI r0, 319
  PUSH r4
  MUL r4, r5, r13
  XOR r20, r0, r10
  SHL r9, r6, r2
  POP r4
  ADD r14, r12, r4
  MUL r8, r15, r2
  MOD r3, r2, r4
  SHR r29, r1, r0
  OR r3, r28, r0
  SHR r10, r14, r5
  PUSH r3
  PUSH r9
  SHL r9, r2, r4
  MOD r12, r3, r4
  SHL r12, r0, r1
  DIV r3, r12, r1
  POP r9
  POP r3
  HALT
