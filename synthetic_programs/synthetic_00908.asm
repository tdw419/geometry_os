; stack save/restore
; initialization
  LDI r7, 0x2325E6
  LDI r1, 2191
  LDI r2, 8
  LDI r0, 3959
  LDI r14, 1095
  PUSH r2
  PUSH r0
  XOR r5, r2, r13
  XOR r8, r2, r11
  MOD r1, r8, r5
  POP r0
  POP r2
  XOR r3, r14, r5
  AND r6, r12, r11
  XOR r12, r9, r8
  SHL r12, r5, r0
  XOR r0, r12, r15
  PUSH r28
  MUL r10, r1, r0
  AND r2, r9, r15
  OR r0, r14, r15
  SHL r15, r6, r9
  ADD r10, r3, r7
  POP r28
  HALT
