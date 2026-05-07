; stack save/restore
; initialization
  LDI r4, 1487
  LDI r8, 128
  LDI r6, 256
  LDI r7, 0xB16944
  LDI r3, 0xE75F95
  LDI r14, 557
  PUSH r3
  PUSH r8
  PUSH r11
  PUSH r3
  DIV r12, r13, r2
  XOR r1, r6, r8
  POP r3
  POP r11
  POP r8
  POP r3
  AND r15, r1, r9
  ADD r8, r10, r12
  SUB r12, r5, r10
  DIV r15, r5, r8
  XOR r7, r8, r3
  PUSH r8
  MUL r11, r14, r10
  AND r4, r0, r3
  SUB r10, r14, r0
  AND r1, r14, r15
  DIV r14, r11, r9
  POP r8
  HALT
