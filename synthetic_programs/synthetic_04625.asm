; stack save/restore
; initialization
  LDI r14, 2230
  LDI r7, 3406
  LDI r15, 0xF82224
  LDI r6, 16
  LDI r20, 0xC59644
  LDI r5, 0x00340A
  LDI r4, 0
  PUSH r10
  ADD r5, r4, r31
  OR r2, r0, r3
  DIV r11, r3, r14
  SHL r14, r1, r11
  POP r10
  MUL r11, r4, r8
  ADD r8, r9, r7
  AND r12, r26, r5
  SUB r4, r0, r10
  PUSH r11
  PUSH r9
  PUSH r8
  OR r14, r10, r5
  MOD r6, r7, r8
  MUL r10, r15, r0
  DIV r11, r14, r9
  OR r4, r6, r3
  POP r8
  POP r9
  POP r11
  HALT
