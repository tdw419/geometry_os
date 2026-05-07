; stack save/restore
; initialization
  LDI r5, 0xDC2F4E
  LDI r8, 0x1BE892
  LDI r11, 0xE85AB5
  LDI r15, 1986
  LDI r2, 16
  PUSH r10
  PUSH r2
  PUSH r12
  PUSH r27
  OR r13, r3, r11
  DIV r11, r14, r8
  SHR r10, r13, r4
  POP r27
  POP r12
  POP r2
  POP r10
  DIV r12, r4, r10
  AND r14, r13, r23
  SHL r9, r10, r13
  DIV r0, r3, r4
  MOD r7, r2, r11
  PUSH r2
  PUSH r6
  SUB r0, r6, r12
  ADD r5, r0, r8
  OR r15, r16, r4
  SHR r6, r3, r28
  DIV r9, r14, r10
  POP r6
  POP r2
  HALT
