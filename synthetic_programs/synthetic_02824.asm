; stack save/restore
; initialization
  LDI r2, 0x6CC5F2
  LDI r15, 8
  LDI r4, 2459
  PUSH r2
  PUSH r7
  PUSH r15
  PUSH r9
  SUB r6, r2, r1
  SHL r15, r12, r5
  SHL r14, r12, r8
  POP r9
  POP r15
  POP r7
  POP r2
  MOD r9, r8, r0
  ADD r6, r15, r8
  AND r13, r11, r15
  XOR r6, r10, r28
  SHL r14, r12, r18
  AND r15, r8, r13
  SUB r6, r0, r8
  PUSH r11
  PUSH r6
  XOR r14, r7, r0
  DIV r22, r16, r0
  POP r6
  POP r11
  HALT
