; stack save/restore
; initialization
  LDI r6, 295
  LDI r5, 534
  LDI r14, 2663
  LDI r4, 8
  LDI r13, 2
  PUSH r0
  PUSH r4
  MUL r4, r3, r11
  OR r13, r6, r7
  POP r4
  POP r0
  SHL r14, r20, r9
  SUB r5, r0, r3
  DIV r6, r15, r14
  ADD r11, r7, r1
  PUSH r10
  MOD r8, r6, r3
  SHL r12, r9, r4
  SUB r12, r7, r8
  XOR r13, r12, r6
  POP r10
  HALT
