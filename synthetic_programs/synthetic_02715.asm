; stack save/restore
; initialization
  LDI r11, 1195
  LDI r14, 2
  LDI r12, 16
  LDI r13, 0x4B9203
  LDI r8, 1919
  PUSH r6
  PUSH r0
  SUB r6, r1, r13
  DIV r3, r8, r2
  OR r12, r11, r0
  SHR r5, r2, r0
  POP r0
  POP r6
  MOD r4, r12, r5
  MOD r6, r0, r12
  AND r12, r2, r0
  OR r8, r6, r11
  ADD r12, r6, r13
  SHR r1, r8, r6
  SHR r6, r9, r0
  SUB r3, r0, r8
  PUSH r9
  ADD r15, r8, r4
  MUL r0, r4, r2
  POP r9
  HALT
