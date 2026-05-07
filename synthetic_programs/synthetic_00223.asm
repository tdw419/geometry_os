; stack save/restore
; initialization
  LDI r13, 0xBB4330
  LDI r3, 0xB33C4F
  LDI r7, 128
  LDI r8, 1915
  LDI r1, 2667
  PUSH r0
  PUSH r12
  SHL r2, r14, r9
  AND r7, r24, r8
  SHL r12, r6, r10
  ADD r1, r12, r5
  MOD r9, r7, r12
  POP r12
  POP r0
  SHL r3, r12, r7
  OR r0, r1, r9
  SHR r12, r9, r1
  DIV r8, r14, r3
  SUB r5, r10, r7
  XOR r12, r11, r13
  OR r2, r1, r9
  PUSH r7
  DIV r13, r12, r7
  OR r0, r10, r15
  DIV r0, r9, r14
  POP r7
  HALT
