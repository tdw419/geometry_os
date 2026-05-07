; stack save/restore
; initialization
  LDI r4, 16
  LDI r5, 1662
  PUSH r5
  OR r4, r12, r9
  MUL r9, r4, r13
  POP r5
  SUB r12, r7, r1
  XOR r9, r4, r15
  SHL r3, r0, r14
  SHL r9, r8, r6
  SHR r1, r5, r2
  ADD r8, r5, r13
  PUSH r7
  SUB r0, r8, r12
  AND r9, r15, r13
  SHL r3, r10, r12
  DIV r1, r11, r12
  OR r11, r6, r5
  POP r7
  HALT
