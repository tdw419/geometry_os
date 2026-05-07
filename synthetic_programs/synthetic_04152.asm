; stack save/restore
; initialization
  LDI r0, 0xF45476
  LDI r10, 64
  LDI r3, 1837
  PUSH r6
  PUSH r1
  MOD r23, r15, r14
  MOD r9, r12, r4
  SUB r2, r7, r12
  SHR r0, r6, r9
  MUL r5, r14, r13
  POP r1
  POP r6
  SUB r16, r10, r13
  SHL r7, r15, r8
  SHR r0, r22, r11
  XOR r12, r5, r4
  AND r15, r14, r0
  XOR r0, r23, r2
  PUSH r4
  PUSH r0
  MUL r12, r4, r11
  XOR r11, r8, r29
  AND r9, r5, r15
  SHR r13, r6, r9
  XOR r14, r9, r12
  POP r0
  POP r4
  HALT
