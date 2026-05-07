; stack save/restore
; initialization
  LDI r1, 4
  LDI r10, 3549
  LDI r2, 1635
  LDI r7, 1
  LDI r15, 10
  LDI r0, 599
  LDI r14, 16
  PUSH r3
  MOD r24, r11, r6
  ADD r0, r24, r4
  XOR r6, r12, r14
  SUB r4, r6, r1
  POP r3
  MOD r11, r5, r2
  ADD r5, r14, r13
  MOD r13, r3, r11
  SHL r2, r6, r4
  DIV r13, r2, r3
  DIV r7, r9, r1
  MOD r4, r13, r1
  SHR r11, r5, r2
  PUSH r5
  XOR r0, r14, r2
  SHR r13, r4, r14
  AND r5, r8, r11
  MOD r0, r12, r6
  POP r5
  HALT
