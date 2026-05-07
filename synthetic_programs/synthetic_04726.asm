; stack save/restore
; initialization
  LDI r0, 32
  LDI r4, 33
  LDI r13, 0x35C304
  LDI r10, 1492
  LDI r11, 1147
  PUSH r11
  PUSH r0
  ADD r9, r10, r12
  ADD r11, r9, r28
  POP r0
  POP r11
  MOD r6, r9, r5
  XOR r10, r2, r17
  SHL r14, r9, r8
  AND r4, r7, r5
  SHL r13, r12, r2
  MOD r7, r5, r25
  DIV r8, r14, r11
  SUB r19, r15, r14
  PUSH r29
  PUSH r13
  PUSH r11
  PUSH r14
  SUB r5, r11, r0
  MUL r8, r4, r5
  SHR r9, r1, r0
  SUB r25, r0, r11
  POP r14
  POP r11
  POP r13
  POP r29
  HALT
