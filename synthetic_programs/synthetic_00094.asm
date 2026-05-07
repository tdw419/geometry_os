; stack save/restore
; initialization
  LDI r2, 64
  LDI r8, 179
  LDI r10, 32
  LDI r6, 0xEFC87A
  LDI r11, 2121
  LDI r0, 0xD2519E
  PUSH r15
  PUSH r1
  PUSH r11
  PUSH r13
  OR r10, r15, r2
  XOR r3, r2, r14
  POP r13
  POP r11
  POP r1
  POP r15
  DIV r13, r14, r4
  SHL r10, r13, r12
  XOR r12, r7, r4
  MOD r10, r6, r11
  XOR r4, r5, r1
  MUL r2, r10, r6
  DIV r13, r23, r6
  PUSH r14
  PUSH r12
  PUSH r6
  ADD r12, r3, r5
  OR r3, r6, r15
  XOR r10, r6, r27
  AND r3, r0, r13
  SHR r19, r9, r13
  POP r6
  POP r12
  POP r14
  HALT
