; stack save/restore
; initialization
  LDI r12, 3365
  LDI r2, 0xA25173
  PUSH r11
  OR r5, r4, r1
  SUB r9, r10, r7
  SHL r9, r8, r2
  POP r11
  MUL r4, r10, r1
  ADD r8, r13, r0
  AND r9, r12, r2
  ADD r13, r6, r4
  SHL r10, r11, r20
  SHL r3, r14, r12
  XOR r5, r10, r14
  PUSH r15
  PUSH r12
  PUSH r7
  PUSH r11
  ADD r15, r0, r13
  MUL r11, r1, r6
  POP r11
  POP r7
  POP r12
  POP r15
  HALT
