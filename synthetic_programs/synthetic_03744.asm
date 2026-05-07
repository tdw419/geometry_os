; stack save/restore
; initialization
  LDI r12, 0x91FAB7
  LDI r20, 1
  LDI r6, 813
  PUSH r5
  SHR r6, r9, r10
  OR r10, r4, r3
  XOR r14, r10, r11
  OR r5, r2, r11
  POP r5
  AND r30, r9, r12
  SUB r8, r15, r14
  MOD r10, r8, r9
  SUB r7, r2, r1
  AND r9, r6, r10
  PUSH r9
  PUSH r15
  PUSH r8
  AND r12, r14, r10
  SHR r13, r14, r1
  MOD r8, r7, r6
  POP r8
  POP r15
  POP r9
  HALT
