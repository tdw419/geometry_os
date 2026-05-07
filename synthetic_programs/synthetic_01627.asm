; stack save/restore
; initialization
  LDI r4, 861
  LDI r1, 2
  LDI r14, 1
  LDI r5, 1022
  PUSH r6
  PUSH r8
  MOD r25, r8, r11
  MUL r25, r7, r26
  AND r15, r4, r13
  MUL r5, r3, r10
  XOR r7, r5, r9
  POP r8
  POP r6
  MUL r4, r0, r12
  ADD r13, r2, r11
  XOR r5, r3, r25
  DIV r11, r0, r13
  SUB r3, r14, r11
  MUL r11, r6, r5
  PUSH r3
  PUSH r4
  ADD r9, r5, r11
  OR r12, r1, r0
  XOR r29, r12, r3
  DIV r4, r8, r13
  POP r4
  POP r3
  HALT
