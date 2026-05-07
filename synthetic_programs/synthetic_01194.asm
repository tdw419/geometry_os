; stack save/restore
; initialization
  LDI r2, 16
  LDI r3, 0x029EB5
  LDI r13, 4
  PUSH r3
  PUSH r3
  PUSH r15
  PUSH r14
  MUL r13, r10, r8
  SHR r15, r14, r5
  SHR r7, r6, r13
  POP r14
  POP r15
  POP r3
  POP r3
  XOR r13, r4, r10
  ADD r6, r2, r8
  MOD r5, r13, r10
  DIV r15, r28, r2
  ADD r1, r15, r11
  ADD r2, r4, r9
  PUSH r6
  PUSH r8
  PUSH r6
  DIV r12, r11, r1
  SHL r15, r2, r5
  MUL r13, r14, r4
  POP r6
  POP r8
  POP r6
  HALT
