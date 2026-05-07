; stack save/restore
; initialization
  LDI r4, 800
  LDI r9, 2163
  LDI r11, 2872
  LDI r2, 1739
  LDI r13, 2
  PUSH r1
  OR r13, r12, r14
  SHL r13, r12, r11
  MUL r9, r14, r6
  POP r1
  XOR r5, r6, r7
  MOD r5, r2, r10
  AND r14, r12, r10
  SHL r1, r2, r15
  SHR r11, r12, r8
  PUSH r5
  PUSH r3
  PUSH r0
  PUSH r9
  ADD r11, r24, r14
  XOR r12, r3, r15
  MOD r14, r11, r5
  MOD r4, r5, r14
  SUB r30, r13, r1
  POP r9
  POP r0
  POP r3
  POP r5
  HALT
