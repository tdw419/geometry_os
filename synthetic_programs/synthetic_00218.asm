; stack save/restore
; initialization
  LDI r6, 0x46EC3D
  LDI r10, 3869
  LDI r2, 530
  LDI r14, 2274
  LDI r0, 950
  LDI r19, 0xCD7AF6
  PUSH r2
  PUSH r23
  PUSH r14
  MOD r9, r15, r10
  MUL r15, r31, r1
  AND r3, r10, r5
  SUB r0, r5, r12
  POP r14
  POP r23
  POP r2
  XOR r17, r12, r0
  MUL r11, r6, r13
  MOD r4, r16, r6
  AND r0, r7, r1
  OR r13, r7, r15
  ADD r7, r8, r13
  PUSH r14
  PUSH r5
  PUSH r11
  PUSH r15
  MOD r12, r4, r8
  SUB r5, r14, r24
  AND r11, r1, r10
  MUL r1, r5, r7
  POP r15
  POP r11
  POP r5
  POP r14
  HALT
