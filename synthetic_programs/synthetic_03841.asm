; stack save/restore
; initialization
  LDI r0, 256
  LDI r1, 0x6FAA58
  LDI r10, 0x25E30F
  LDI r11, 3739
  PUSH r4
  PUSH r27
  PUSH r17
  SHL r11, r2, r9
  MUL r12, r15, r3
  AND r13, r9, r6
  SHL r11, r13, r9
  POP r17
  POP r27
  POP r4
  ADD r7, r4, r14
  DIV r9, r12, r2
  AND r9, r11, r4
  ADD r3, r7, r10
  DIV r4, r0, r15
  XOR r11, r8, r1
  DIV r7, r9, r8
  SHL r4, r28, r15
  PUSH r7
  PUSH r4
  DIV r2, r7, r10
  AND r4, r13, r6
  POP r4
  POP r7
  HALT
