; stack save/restore
; initialization
  LDI r2, 16
  LDI r1, 346
  LDI r3, 1724
  LDI r8, 1
  LDI r31, 0
  LDI r17, 0xFCC71F
  LDI r6, 32
  PUSH r4
  PUSH r10
  PUSH r7
  ADD r1, r15, r13
  AND r12, r11, r10
  SUB r7, r15, r4
  AND r3, r14, r0
  DIV r2, r3, r4
  POP r7
  POP r10
  POP r4
  OR r7, r3, r12
  ADD r0, r11, r12
  SHR r0, r12, r8
  PUSH r9
  SUB r4, r5, r30
  MUL r0, r1, r12
  ADD r5, r9, r13
  SHL r4, r10, r12
  MOD r6, r14, r27
  POP r9
  HALT
