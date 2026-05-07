; stack save/restore
; initialization
  LDI r1, 0
  LDI r12, 255
  LDI r2, 2808
  LDI r0, 1
  LDI r15, 8
  PUSH r1
  AND r6, r8, r13
  SHR r9, r2, r13
  ADD r15, r5, r13
  SHR r4, r5, r12
  POP r1
  SUB r8, r11, r1
  OR r12, r0, r8
  AND r4, r9, r3
  DIV r2, r7, r11
  AND r6, r13, r4
  SUB r12, r7, r1
  PUSH r13
  PUSH r3
  PUSH r7
  PUSH r5
  DIV r14, r3, r13
  SHL r1, r6, r11
  POP r5
  POP r7
  POP r3
  POP r13
  HALT
