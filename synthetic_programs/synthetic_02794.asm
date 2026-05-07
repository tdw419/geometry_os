; stack save/restore
; initialization
  LDI r4, 4
  LDI r8, 1390
  LDI r23, 0x116754
  LDI r12, 741
  LDI r26, 2406
  LDI r6, 0xECF849
  PUSH r11
  PUSH r9
  DIV r11, r13, r15
  SUB r12, r2, r13
  DIV r13, r10, r2
  DIV r5, r12, r13
  POP r9
  POP r11
  DIV r9, r3, r7
  MUL r5, r0, r13
  SHL r1, r15, r7
  PUSH r13
  PUSH r3
  PUSH r3
  PUSH r23
  ADD r14, r11, r12
  SHR r8, r7, r10
  XOR r11, r2, r15
  MUL r0, r9, r14
  POP r23
  POP r3
  POP r3
  POP r13
  HALT
