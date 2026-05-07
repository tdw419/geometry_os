; stack save/restore
; initialization
  LDI r6, 1283
  LDI r13, 255
  LDI r9, 1362
  LDI r8, 0x25C9A0
  LDI r10, 2487
  PUSH r13
  PUSH r1
  SHL r6, r13, r1
  DIV r8, r15, r4
  DIV r15, r10, r8
  POP r1
  POP r13
  ADD r3, r7, r14
  SUB r12, r5, r8
  SHL r4, r5, r0
  PUSH r1
  PUSH r14
  PUSH r11
  SUB r9, r2, r14
  OR r6, r4, r7
  SHL r6, r5, r30
  POP r11
  POP r14
  POP r1
  HALT
