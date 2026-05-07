; stack save/restore
; initialization
  LDI r12, 256
  LDI r8, 3293
  LDI r9, 4
  LDI r6, 1
  LDI r11, 0x9B22F0
  PUSH r28
  PUSH r13
  PUSH r17
  AND r13, r14, r0
  ADD r12, r11, r3
  AND r14, r1, r0
  POP r17
  POP r13
  POP r28
  AND r19, r0, r1
  ADD r3, r1, r9
  XOR r7, r6, r9
  AND r3, r17, r8
  DIV r0, r13, r2
  MOD r2, r11, r3
  DIV r0, r8, r5
  PUSH r10
  PUSH r0
  PUSH r14
  XOR r5, r10, r0
  AND r7, r9, r15
  POP r14
  POP r0
  POP r10
  HALT
