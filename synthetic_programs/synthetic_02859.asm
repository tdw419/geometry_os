; stack save/restore
; initialization
  LDI r0, 3439
  LDI r6, 0x478C6F
  LDI r3, 1
  LDI r11, 256
  LDI r30, 0x1EED52
  LDI r14, 2
  PUSH r7
  PUSH r5
  SUB r5, r15, r1
  SUB r2, r1, r10
  MUL r2, r6, r5
  POP r5
  POP r7
  XOR r6, r30, r4
  SHR r8, r10, r1
  MUL r13, r8, r14
  XOR r1, r15, r16
  PUSH r2
  PUSH r2
  DIV r6, r11, r15
  DIV r3, r14, r11
  MUL r10, r7, r3
  AND r22, r5, r6
  POP r2
  POP r2
  HALT
