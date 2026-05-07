; stack save/restore
; initialization
  LDI r6, 0xE28AC5
  LDI r14, 4
  LDI r2, 2613
  PUSH r5
  ADD r3, r11, r9
  SUB r5, r13, r7
  POP r5
  MUL r0, r6, r4
  MUL r6, r1, r10
  ADD r13, r12, r0
  MOD r12, r5, r10
  PUSH r3
  PUSH r0
  SUB r13, r12, r9
  SHL r0, r9, r5
  SHL r0, r4, r13
  POP r0
  POP r3
  HALT
