; stack save/restore
; initialization
  LDI r4, 0x67B3EC
  LDI r2, 3596
  LDI r19, 0
  LDI r1, 10
  PUSH r10
  PUSH r19
  PUSH r5
  PUSH r2
  SHL r15, r13, r0
  MOD r0, r1, r11
  MUL r12, r1, r0
  POP r2
  POP r5
  POP r19
  POP r10
  SHL r3, r0, r7
  SHL r4, r13, r0
  ADD r15, r2, r13
  SHR r14, r1, r5
  XOR r7, r14, r2
  DIV r8, r10, r3
  SHL r14, r5, r6
  XOR r4, r12, r2
  PUSH r14
  SUB r5, r13, r7
  XOR r8, r11, r0
  POP r14
  HALT
