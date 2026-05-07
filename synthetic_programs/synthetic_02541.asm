; stack save/restore
; initialization
  LDI r1, 0x690660
  LDI r3, 3038
  LDI r2, 4
  LDI r6, 2763
  LDI r4, 0x949331
  LDI r10, 0x4A2534
  LDI r5, 1353
  PUSH r8
  PUSH r10
  ADD r8, r0, r6
  DIV r13, r0, r12
  OR r7, r8, r12
  MUL r24, r13, r12
  ADD r3, r15, r7
  POP r10
  POP r8
  SHL r13, r11, r8
  MUL r1, r0, r12
  SHL r8, r0, r15
  SUB r1, r15, r0
  SHR r6, r22, r13
  SHL r9, r8, r0
  DIV r12, r1, r7
  PUSH r11
  SHL r9, r3, r15
  XOR r4, r2, r12
  POP r11
  HALT
