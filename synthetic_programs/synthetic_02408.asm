; stack save/restore
; initialization
  LDI r12, 0xE6166B
  LDI r6, 1789
  LDI r4, 0
  PUSH r4
  MOD r4, r7, r8
  OR r15, r13, r12
  POP r4
  ADD r7, r1, r6
  SHR r6, r11, r0
  ADD r5, r9, r15
  SHR r13, r14, r12
  SUB r8, r15, r10
  OR r28, r5, r8
  SUB r30, r6, r14
  SUB r7, r11, r4
  PUSH r13
  PUSH r6
  PUSH r3
  PUSH r0
  MUL r14, r1, r4
  SHR r5, r14, r15
  POP r0
  POP r3
  POP r6
  POP r13
  HALT
