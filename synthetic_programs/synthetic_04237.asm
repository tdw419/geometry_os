; stack save/restore
; initialization
  LDI r6, 8
  LDI r8, 3975
  LDI r9, 10
  PUSH r7
  PUSH r11
  MUL r9, r14, r7
  SUB r10, r12, r1
  SHR r10, r9, r14
  OR r1, r11, r3
  POP r11
  POP r7
  MUL r11, r15, r14
  DIV r10, r8, r15
  XOR r9, r14, r1
  SHL r7, r0, r2
  PUSH r13
  PUSH r12
  PUSH r5
  ADD r14, r3, r1
  XOR r10, r0, r12
  AND r9, r6, r4
  POP r5
  POP r12
  POP r13
  HALT
