; stack save/restore
; initialization
  LDI r11, 32
  LDI r4, 0xB4A4B9
  LDI r0, 3564
  LDI r6, 3190
  LDI r8, 2776
  LDI r2, 128
  LDI r1, 0x0DD2B1
  LDI r12, 0x26C045
  PUSH r2
  PUSH r6
  PUSH r10
  OR r9, r0, r4
  DIV r9, r7, r10
  POP r10
  POP r6
  POP r2
  AND r6, r2, r4
  AND r2, r10, r6
  ADD r3, r11, r12
  MUL r4, r2, r13
  ADD r10, r8, r6
  XOR r12, r13, r7
  MOD r8, r1, r6
  PUSH r4
  PUSH r10
  PUSH r4
  PUSH r7
  AND r28, r6, r24
  XOR r31, r2, r7
  POP r7
  POP r4
  POP r10
  POP r4
  HALT
