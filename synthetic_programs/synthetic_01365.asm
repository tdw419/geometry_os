; stack save/restore
; initialization
  LDI r13, 0x90A614
  LDI r0, 3307
  LDI r9, 418
  LDI r5, 501
  LDI r6, 1745
  LDI r14, 0
  LDI r10, 0x237B2C
  LDI r29, 0xDEF8ED
  PUSH r13
  PUSH r10
  PUSH r3
  PUSH r13
  SUB r12, r5, r13
  SUB r8, r0, r1
  OR r0, r25, r10
  SUB r12, r4, r11
  AND r15, r1, r13
  POP r13
  POP r3
  POP r10
  POP r13
  MUL r7, r4, r12
  SHR r9, r8, r6
  SHL r8, r9, r6
  PUSH r12
  PUSH r7
  PUSH r11
  PUSH r13
  ADD r2, r13, r3
  SHL r9, r7, r2
  POP r13
  POP r11
  POP r7
  POP r12
  HALT
