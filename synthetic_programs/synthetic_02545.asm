; stack save/restore
; initialization
  LDI r10, 1566
  LDI r6, 0x58EEEB
  LDI r11, 0x1EBE4B
  LDI r9, 2
  PUSH r8
  PUSH r7
  ADD r13, r1, r11
  DIV r13, r4, r5
  MOD r14, r1, r0
  POP r7
  POP r8
  AND r4, r10, r12
  SUB r10, r4, r3
  SHL r0, r1, r4
  AND r4, r7, r10
  SHL r11, r8, r5
  PUSH r28
  PUSH r14
  PUSH r1
  OR r10, r23, r14
  MUL r4, r5, r3
  AND r8, r14, r9
  MOD r4, r1, r3
  AND r11, r12, r14
  POP r1
  POP r14
  POP r28
  HALT
