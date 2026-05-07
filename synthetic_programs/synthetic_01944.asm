; stack save/restore
; initialization
  LDI r15, 16
  LDI r3, 3339
  LDI r1, 0x0E9F15
  LDI r10, 256
  LDI r13, 128
  PUSH r0
  PUSH r9
  PUSH r6
  PUSH r3
  DIV r3, r0, r1
  MUL r13, r9, r8
  SHL r4, r5, r30
  XOR r13, r24, r7
  POP r3
  POP r6
  POP r9
  POP r0
  MOD r9, r6, r14
  XOR r7, r9, r3
  SHR r15, r22, r13
  DIV r4, r5, r2
  PUSH r17
  PUSH r12
  DIV r14, r0, r9
  XOR r15, r11, r13
  SHR r15, r5, r6
  ADD r25, r5, r3
  POP r12
  POP r17
  HALT
