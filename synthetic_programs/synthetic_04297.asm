; stack save/restore
; initialization
  LDI r0, 1503
  LDI r8, 0x39A658
  LDI r15, 1
  LDI r14, 4049
  LDI r10, 3734
  LDI r11, 32
  PUSH r21
  PUSH r8
  PUSH r6
  XOR r10, r2, r7
  MOD r11, r14, r12
  ADD r4, r0, r8
  POP r6
  POP r8
  POP r21
  SHL r6, r4, r7
  MOD r22, r6, r11
  XOR r0, r3, r13
  AND r6, r4, r13
  PUSH r11
  PUSH r5
  PUSH r9
  DIV r11, r1, r4
  ADD r15, r12, r7
  XOR r9, r12, r29
  SHL r11, r23, r10
  POP r9
  POP r5
  POP r11
  HALT
