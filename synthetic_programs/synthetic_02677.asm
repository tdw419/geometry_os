; stack save/restore
; initialization
  LDI r1, 4
  LDI r7, 713
  LDI r14, 1
  LDI r12, 1384
  LDI r10, 256
  LDI r2, 256
  PUSH r9
  PUSH r4
  PUSH r4
  PUSH r1
  XOR r0, r13, r11
  SUB r2, r1, r9
  POP r1
  POP r4
  POP r4
  POP r9
  AND r12, r10, r2
  ADD r3, r11, r8
  SUB r2, r4, r7
  MOD r12, r3, r4
  MOD r8, r6, r3
  PUSH r1
  PUSH r9
  AND r4, r15, r8
  SHR r0, r1, r4
  SHR r7, r5, r6
  POP r9
  POP r1
  HALT
