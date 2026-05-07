; stack save/restore
; initialization
  LDI r20, 256
  LDI r12, 0x9E9388
  LDI r15, 913
  LDI r8, 10
  LDI r26, 0xC59813
  LDI r14, 4
  LDI r28, 2027
  PUSH r12
  PUSH r5
  PUSH r18
  PUSH r3
  SHL r5, r4, r0
  MUL r6, r5, r15
  OR r15, r8, r22
  DIV r5, r12, r11
  POP r3
  POP r18
  POP r5
  POP r12
  SUB r10, r5, r11
  SHR r0, r4, r13
  XOR r1, r7, r13
  PUSH r3
  ADD r2, r6, r1
  XOR r7, r10, r13
  POP r3
  HALT
