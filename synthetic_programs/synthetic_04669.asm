; stack save/restore
; initialization
  LDI r8, 1607
  LDI r12, 323
  LDI r0, 2705
  LDI r15, 311
  PUSH r6
  PUSH r9
  PUSH r7
  XOR r4, r8, r0
  SHR r11, r6, r5
  ADD r11, r5, r9
  POP r7
  POP r9
  POP r6
  MUL r2, r12, r14
  SHL r14, r24, r6
  DIV r11, r23, r8
  MUL r4, r8, r9
  PUSH r0
  PUSH r8
  PUSH r9
  OR r12, r24, r22
  MUL r8, r3, r10
  MUL r12, r8, r14
  SHR r19, r15, r9
  POP r9
  POP r8
  POP r0
  HALT
