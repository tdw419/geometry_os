; stack save/restore
; initialization
  LDI r5, 256
  LDI r1, 3015
  LDI r10, 1997
  LDI r7, 657
  LDI r11, 8
  PUSH r0
  PUSH r7
  XOR r4, r8, r14
  SHR r10, r12, r7
  MUL r3, r6, r5
  XOR r13, r12, r6
  POP r7
  POP r0
  SUB r1, r5, r0
  OR r6, r14, r7
  OR r15, r3, r6
  ADD r7, r13, r12
  XOR r8, r23, r7
  PUSH r6
  PUSH r4
  PUSH r11
  MUL r13, r31, r5
  XOR r12, r5, r4
  XOR r2, r6, r11
  DIV r13, r4, r3
  MOD r3, r6, r7
  POP r11
  POP r4
  POP r6
  HALT
