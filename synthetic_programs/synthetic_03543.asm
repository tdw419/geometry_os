; stack save/restore
; initialization
  LDI r15, 64
  LDI r0, 0xCC2B0C
  LDI r12, 32
  LDI r9, 0x1E2B3E
  LDI r10, 2
  LDI r3, 873
  PUSH r7
  PUSH r1
  ADD r9, r5, r4
  SUB r14, r10, r3
  XOR r5, r17, r4
  SHL r4, r9, r11
  POP r1
  POP r7
  MOD r8, r1, r7
  AND r8, r11, r15
  AND r8, r14, r6
  ADD r11, r14, r6
  PUSH r8
  SHL r10, r20, r1
  AND r5, r6, r8
  MOD r7, r13, r3
  POP r8
  HALT
