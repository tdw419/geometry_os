; stack save/restore
; initialization
  LDI r6, 2198
  LDI r3, 144
  LDI r2, 0xF79DFF
  LDI r12, 32
  PUSH r13
  SHR r24, r1, r9
  ADD r0, r4, r26
  MUL r12, r8, r1
  DIV r10, r14, r13
  DIV r1, r3, r9
  POP r13
  AND r14, r4, r12
  DIV r16, r9, r14
  AND r14, r11, r13
  MOD r6, r0, r5
  SHL r2, r5, r0
  OR r0, r7, r11
  OR r9, r7, r3
  PUSH r12
  PUSH r1
  PUSH r7
  AND r12, r3, r14
  MOD r0, r5, r3
  SHR r6, r9, r7
  POP r7
  POP r1
  POP r12
  HALT
