; stack save/restore
; initialization
  LDI r8, 64
  LDI r25, 0
  LDI r15, 3441
  LDI r10, 128
  LDI r13, 2490
  PUSH r6
  PUSH r0
  PUSH r4
  PUSH r12
  ADD r6, r11, r31
  OR r9, r12, r6
  ADD r8, r13, r0
  OR r4, r11, r27
  ADD r4, r12, r7
  POP r12
  POP r4
  POP r0
  POP r6
  SHL r0, r10, r14
  DIV r4, r13, r8
  AND r0, r4, r1
  AND r17, r8, r13
  MOD r14, r7, r12
  XOR r7, r6, r14
  SHR r6, r12, r4
  SHL r14, r13, r19
  PUSH r4
  PUSH r1
  PUSH r7
  PUSH r15
  SHL r0, r8, r12
  ADD r6, r5, r11
  ADD r14, r4, r13
  POP r15
  POP r7
  POP r1
  POP r4
  HALT
