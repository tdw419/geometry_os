; stack save/restore
; initialization
  LDI r7, 128
  LDI r2, 0xC11B71
  PUSH r27
  PUSH r14
  PUSH r10
  PUSH r31
  DIV r9, r8, r5
  SHL r3, r8, r12
  MOD r4, r8, r7
  ADD r4, r9, r5
  POP r31
  POP r10
  POP r14
  POP r27
  AND r7, r9, r11
  OR r20, r3, r8
  SUB r1, r3, r12
  SHL r11, r2, r22
  MUL r25, r10, r6
  OR r13, r10, r14
  DIV r8, r12, r1
  PUSH r3
  PUSH r9
  PUSH r7
  PUSH r11
  ADD r8, r0, r9
  SUB r4, r8, r9
  DIV r10, r14, r6
  POP r11
  POP r7
  POP r9
  POP r3
  HALT
