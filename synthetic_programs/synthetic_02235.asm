; stack save/restore
; initialization
  LDI r13, 1579
  LDI r8, 0xB57D38
  LDI r0, 1589
  LDI r5, 256
  LDI r9, 0x9F5533
  LDI r1, 0x349640
  LDI r11, 0
  PUSH r2
  PUSH r8
  PUSH r8
  AND r5, r14, r12
  ADD r9, r28, r11
  OR r7, r10, r1
  XOR r2, r15, r3
  POP r8
  POP r8
  POP r2
  MUL r8, r11, r7
  SUB r14, r0, r2
  MOD r9, r2, r4
  AND r2, r13, r22
  DIV r6, r8, r2
  SHL r15, r11, r6
  SHL r5, r2, r11
  SHL r0, r14, r6
  PUSH r1
  MUL r7, r4, r9
  MOD r3, r7, r12
  DIV r9, r12, r13
  POP r1
  HALT
