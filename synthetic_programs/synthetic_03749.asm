; stack save/restore
; initialization
  LDI r7, 8
  LDI r3, 10
  LDI r10, 256
  LDI r5, 32
  PUSH r9
  MOD r1, r9, r15
  SHR r1, r11, r6
  AND r2, r5, r8
  XOR r5, r8, r14
  OR r9, r15, r13
  POP r9
  AND r0, r7, r6
  XOR r23, r0, r9
  MOD r15, r12, r8
  DIV r6, r30, r5
  SHL r2, r10, r1
  AND r4, r12, r7
  PUSH r14
  PUSH r7
  PUSH r10
  SHR r1, r3, r9
  ADD r5, r9, r0
  ADD r14, r11, r3
  POP r10
  POP r7
  POP r14
  HALT
