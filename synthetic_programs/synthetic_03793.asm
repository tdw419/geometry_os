; stack save/restore
; initialization
  LDI r8, 1
  LDI r12, 10
  LDI r0, 127
  LDI r4, 16
  PUSH r14
  PUSH r1
  PUSH r9
  SUB r1, r7, r10
  SUB r17, r12, r15
  ADD r1, r10, r7
  OR r5, r7, r14
  SHL r1, r11, r6
  POP r9
  POP r1
  POP r14
  SHL r7, r2, r9
  MOD r10, r5, r1
  SUB r8, r13, r6
  AND r9, r5, r0
  PUSH r8
  AND r6, r4, r1
  MUL r2, r20, r1
  POP r8
  HALT
