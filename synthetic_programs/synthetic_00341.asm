; stack save/restore
; initialization
  LDI r13, 64
  LDI r14, 0x26EC42
  LDI r5, 1804
  PUSH r14
  PUSH r13
  PUSH r9
  MUL r7, r3, r15
  SHL r3, r10, r11
  SHL r14, r0, r1
  AND r1, r11, r6
  POP r9
  POP r13
  POP r14
  ADD r6, r8, r15
  MUL r21, r5, r11
  SHR r4, r11, r5
  PUSH r3
  PUSH r9
  PUSH r11
  SHL r12, r4, r8
  DIV r4, r0, r1
  MOD r13, r12, r5
  SHR r1, r19, r14
  SHR r13, r7, r11
  POP r11
  POP r9
  POP r3
  HALT
