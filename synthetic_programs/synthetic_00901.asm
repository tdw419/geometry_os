; stack save/restore
; initialization
  LDI r4, 2968
  LDI r3, 16
  PUSH r7
  PUSH r0
  SHL r7, r9, r3
  SUB r21, r15, r10
  SHR r7, r10, r19
  XOR r4, r3, r29
  POP r0
  POP r7
  ADD r9, r8, r13
  MOD r5, r0, r1
  SHL r30, r8, r0
  PUSH r5
  PUSH r4
  SHL r31, r0, r6
  ADD r5, r2, r15
  POP r4
  POP r5
  HALT
