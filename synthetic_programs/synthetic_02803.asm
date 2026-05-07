; stack save/restore
; initialization
  LDI r8, 3102
  LDI r14, 1794
  LDI r10, 0xEF356F
  LDI r22, 255
  LDI r6, 2
  LDI r13, 35
  LDI r2, 0xCCC75B
  PUSH r10
  PUSH r8
  PUSH r0
  PUSH r3
  SUB r11, r5, r1
  SHL r7, r15, r14
  MUL r6, r10, r5
  AND r24, r6, r11
  SHR r10, r8, r29
  POP r3
  POP r0
  POP r8
  POP r10
  MOD r8, r9, r4
  MOD r7, r12, r4
  MUL r15, r1, r0
  AND r3, r11, r9
  AND r4, r9, r10
  ADD r0, r14, r12
  PUSH r9
  PUSH r0
  PUSH r29
  SHR r9, r10, r0
  MOD r14, r15, r9
  POP r29
  POP r0
  POP r9
  HALT
