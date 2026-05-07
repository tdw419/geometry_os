; stack save/restore
; initialization
  LDI r14, 255
  LDI r15, 0x7571A7
  LDI r28, 0x0D26F3
  LDI r12, 1316
  LDI r1, 3074
  LDI r10, 10
  LDI r11, 2221
  LDI r7, 744
  PUSH r14
  PUSH r7
  PUSH r11
  PUSH r6
  SHL r14, r12, r2
  SHL r1, r8, r6
  POP r6
  POP r11
  POP r7
  POP r14
  SUB r8, r10, r0
  SHL r14, r15, r13
  DIV r7, r15, r22
  PUSH r1
  PUSH r2
  PUSH r13
  PUSH r0
  SHR r5, r27, r2
  ADD r11, r5, r13
  MOD r11, r29, r7
  POP r0
  POP r13
  POP r2
  POP r1
  HALT
