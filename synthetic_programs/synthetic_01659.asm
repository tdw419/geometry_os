; stack save/restore
; initialization
  LDI r12, 0x1451F3
  LDI r9, 64
  LDI r10, 0x196C84
  LDI r13, 407
  LDI r14, 1110
  LDI r3, 731
  LDI r8, 3037
  PUSH r7
  PUSH r9
  SUB r10, r3, r2
  SHL r3, r11, r5
  AND r13, r1, r9
  AND r5, r13, r3
  POP r9
  POP r7
  OR r13, r12, r5
  SUB r13, r12, r10
  SUB r10, r3, r2
  SUB r25, r5, r13
  AND r2, r11, r8
  PUSH r3
  AND r1, r10, r14
  MOD r5, r3, r10
  POP r3
  HALT
