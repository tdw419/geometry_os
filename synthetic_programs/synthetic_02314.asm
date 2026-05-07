; stack save/restore
; initialization
  LDI r14, 0x66A4F9
  LDI r5, 1
  PUSH r7
  PUSH r11
  PUSH r3
  PUSH r15
  MOD r11, r3, r15
  MOD r9, r15, r6
  POP r15
  POP r3
  POP r11
  POP r7
  ADD r7, r15, r4
  AND r3, r10, r2
  ADD r3, r2, r11
  ADD r6, r10, r9
  AND r15, r14, r2
  SHL r4, r15, r6
  PUSH r1
  PUSH r4
  PUSH r14
  PUSH r10
  MOD r10, r8, r12
  AND r5, r1, r12
  XOR r0, r5, r3
  DIV r9, r1, r15
  SHL r2, r11, r6
  POP r10
  POP r14
  POP r4
  POP r1
  HALT
