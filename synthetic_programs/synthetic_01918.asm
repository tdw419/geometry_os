; stack save/restore
; initialization
  LDI r15, 672
  LDI r12, 8
  PUSH r9
  PUSH r11
  PUSH r10
  PUSH r9
  XOR r0, r13, r12
  XOR r15, r8, r6
  MOD r10, r0, r15
  ADD r0, r8, r6
  POP r9
  POP r10
  POP r11
  POP r9
  SHR r9, r8, r14
  OR r0, r4, r2
  SHL r10, r8, r11
  MUL r3, r10, r6
  PUSH r2
  MOD r13, r0, r1
  MUL r10, r2, r7
  MOD r23, r9, r8
  MUL r2, r8, r6
  ADD r20, r7, r14
  POP r2
  HALT
