; stack save/restore
; initialization
  LDI r1, 2890
  LDI r2, 0
  LDI r10, 2
  LDI r15, 8
  LDI r4, 255
  PUSH r27
  PUSH r2
  PUSH r14
  PUSH r5
  DIV r7, r0, r15
  DIV r7, r27, r24
  ADD r4, r3, r1
  SHR r11, r4, r13
  MUL r7, r17, r11
  POP r5
  POP r14
  POP r2
  POP r27
  DIV r31, r9, r12
  MOD r9, r8, r3
  DIV r6, r11, r7
  SHL r13, r12, r15
  AND r14, r10, r17
  AND r2, r14, r9
  MUL r5, r4, r13
  AND r11, r6, r9
  PUSH r1
  PUSH r13
  ADD r12, r10, r9
  XOR r13, r4, r8
  POP r13
  POP r1
  HALT
