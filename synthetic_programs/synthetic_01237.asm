; stack save/restore
; initialization
  LDI r11, 1
  LDI r10, 16
  LDI r14, 4
  PUSH r12
  SHL r6, r2, r8
  MOD r4, r0, r15
  DIV r12, r4, r1
  POP r12
  AND r13, r9, r1
  SUB r9, r8, r15
  DIV r6, r5, r13
  ADD r13, r11, r10
  ADD r11, r7, r8
  SHL r10, r1, r0
  ADD r6, r3, r11
  SHR r10, r2, r6
  PUSH r2
  MUL r9, r11, r6
  XOR r8, r3, r12
  MOD r14, r3, r8
  POP r2
  HALT
