; stack save/restore
; initialization
  LDI r7, 0xE9A364
  LDI r4, 1
  PUSH r1
  MUL r26, r12, r13
  AND r15, r3, r4
  POP r1
  SHL r8, r7, r3
  DIV r14, r7, r10
  SUB r7, r9, r15
  XOR r7, r0, r8
  MOD r13, r1, r25
  DIV r8, r5, r4
  XOR r10, r9, r1
  ADD r3, r5, r11
  PUSH r8
  PUSH r13
  PUSH r1
  XOR r3, r2, r14
  MOD r3, r1, r14
  POP r1
  POP r13
  POP r8
  HALT
