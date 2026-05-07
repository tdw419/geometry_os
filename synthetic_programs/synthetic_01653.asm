; stack save/restore
; initialization
  LDI r10, 0xDF191A
  LDI r1, 10
  LDI r3, 2197
  LDI r7, 1942
  PUSH r12
  PUSH r8
  PUSH r8
  PUSH r1
  ADD r2, r23, r26
  MUL r29, r5, r13
  MOD r11, r0, r28
  DIV r6, r1, r8
  POP r1
  POP r8
  POP r8
  POP r12
  SUB r7, r9, r1
  SHL r4, r8, r2
  OR r8, r14, r1
  OR r7, r2, r8
  ADD r4, r14, r5
  OR r14, r11, r31
  PUSH r7
  PUSH r5
  PUSH r8
  DIV r4, r9, r5
  OR r11, r10, r13
  SHR r4, r1, r20
  POP r8
  POP r5
  POP r7
  HALT
