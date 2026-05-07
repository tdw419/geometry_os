; stack save/restore
; initialization
  LDI r11, 2584
  LDI r0, 3535
  LDI r13, 208
  LDI r8, 0xA11630
  LDI r5, 699
  LDI r6, 753
  PUSH r15
  AND r14, r0, r21
  XOR r10, r14, r1
  OR r3, r15, r29
  DIV r8, r2, r1
  SHR r12, r15, r0
  POP r15
  OR r7, r3, r1
  SUB r19, r11, r8
  MUL r12, r2, r0
  SUB r11, r10, r5
  PUSH r5
  PUSH r21
  PUSH r0
  ADD r10, r12, r9
  MOD r6, r13, r0
  SUB r14, r7, r8
  POP r0
  POP r21
  POP r5
  HALT
