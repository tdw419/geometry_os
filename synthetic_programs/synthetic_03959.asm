; stack save/restore
; initialization
  LDI r8, 0xAA2294
  LDI r9, 0
  LDI r11, 2
  LDI r3, 0
  LDI r5, 32
  PUSH r3
  PUSH r4
  PUSH r8
  SUB r14, r6, r11
  AND r6, r2, r9
  DIV r2, r1, r13
  OR r14, r15, r8
  POP r8
  POP r4
  POP r3
  SHR r3, r14, r5
  ADD r29, r10, r6
  ADD r10, r0, r7
  PUSH r5
  XOR r5, r7, r0
  DIV r15, r1, r8
  POP r5
  HALT
