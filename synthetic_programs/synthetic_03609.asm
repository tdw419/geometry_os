; stack save/restore
; initialization
  LDI r4, 0xCCB9EA
  LDI r16, 1
  LDI r13, 1027
  LDI r12, 256
  LDI r11, 32
  LDI r2, 2687
  PUSH r2
  PUSH r5
  PUSH r1
  PUSH r13
  DIV r7, r0, r11
  AND r12, r8, r4
  MUL r25, r11, r1
  DIV r14, r15, r1
  AND r15, r6, r14
  POP r13
  POP r1
  POP r5
  POP r2
  SUB r9, r7, r10
  MOD r8, r12, r3
  MOD r8, r5, r2
  SUB r5, r9, r15
  ADD r3, r23, r2
  SUB r12, r6, r11
  PUSH r11
  PUSH r14
  PUSH r0
  PUSH r19
  SHL r0, r2, r3
  SHL r7, r5, r1
  POP r19
  POP r0
  POP r14
  POP r11
  HALT
