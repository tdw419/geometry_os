; stack save/restore
; initialization
  LDI r4, 0x7551D4
  LDI r0, 0x552467
  LDI r2, 0x3481C0
  PUSH r5
  PUSH r7
  PUSH r7
  PUSH r4
  DIV r3, r5, r6
  SHR r8, r1, r11
  MUL r2, r4, r3
  AND r7, r5, r6
  POP r4
  POP r7
  POP r7
  POP r5
  SUB r11, r3, r4
  AND r9, r4, r13
  SHL r1, r0, r12
  XOR r9, r11, r6
  MUL r6, r10, r14
  MOD r9, r14, r16
  ADD r2, r5, r14
  SUB r2, r4, r13
  PUSH r24
  ADD r1, r13, r26
  MOD r7, r1, r13
  MOD r3, r14, r5
  POP r24
  HALT
