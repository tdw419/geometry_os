; stack save/restore
; initialization
  LDI r0, 2240
  LDI r7, 0xDDE09F
  PUSH r12
  PUSH r14
  PUSH r10
  AND r15, r3, r13
  OR r6, r15, r3
  ADD r3, r4, r15
  MOD r9, r6, r2
  POP r10
  POP r14
  POP r12
  SHL r2, r3, r0
  AND r8, r10, r12
  MOD r5, r0, r13
  SUB r0, r8, r9
  MUL r21, r13, r14
  SUB r1, r9, r15
  DIV r0, r15, r10
  OR r6, r8, r26
  PUSH r3
  PUSH r7
  PUSH r13
  MOD r7, r13, r11
  SHL r15, r6, r5
  ADD r15, r8, r3
  SHR r13, r9, r11
  POP r13
  POP r7
  POP r3
  HALT
