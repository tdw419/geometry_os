; stack save/restore
; initialization
  LDI r22, 0x5A98EF
  LDI r14, 0x5EB626
  LDI r0, 64
  LDI r1, 1114
  PUSH r2
  SHR r1, r7, r2
  SHL r15, r6, r5
  OR r15, r23, r5
  POP r2
  SHR r8, r7, r20
  SHL r5, r15, r7
  MOD r23, r7, r16
  SHR r15, r1, r6
  AND r13, r15, r11
  SHL r7, r9, r11
  PUSH r4
  PUSH r5
  PUSH r7
  PUSH r11
  MUL r10, r14, r11
  SHR r2, r0, r4
  MUL r7, r13, r5
  POP r11
  POP r7
  POP r5
  POP r4
  HALT
