; stack save/restore
; initialization
  LDI r15, 1246
  LDI r0, 4
  LDI r7, 0xBAEFBA
  PUSH r0
  PUSH r11
  PUSH r9
  PUSH r1
  MUL r15, r11, r3
  XOR r11, r14, r2
  SUB r17, r10, r8
  OR r0, r9, r7
  XOR r15, r3, r2
  POP r1
  POP r9
  POP r11
  POP r0
  ADD r11, r4, r10
  OR r11, r15, r13
  AND r1, r13, r0
  MUL r0, r1, r13
  MOD r14, r10, r6
  ADD r6, r10, r8
  AND r7, r8, r22
  PUSH r9
  PUSH r13
  MUL r11, r24, r0
  SUB r12, r4, r6
  SHR r8, r3, r2
  DIV r2, r30, r8
  POP r13
  POP r9
  HALT
