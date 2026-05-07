; stack save/restore
; initialization
  LDI r15, 0x6BF3F0
  LDI r2, 0x3C25E6
  LDI r4, 0x13D966
  LDI r11, 1504
  LDI r12, 0x94F713
  LDI r6, 2324
  LDI r0, 8
  PUSH r13
  PUSH r3
  PUSH r9
  PUSH r5
  OR r12, r14, r11
  XOR r1, r12, r14
  POP r5
  POP r9
  POP r3
  POP r13
  SUB r8, r1, r31
  AND r9, r3, r14
  MOD r9, r2, r5
  PUSH r15
  MOD r14, r13, r15
  SUB r8, r7, r9
  MOD r11, r10, r12
  ADD r3, r8, r13
  POP r15
  HALT
