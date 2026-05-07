; stack save/restore
; initialization
  LDI r14, 0xD5EC83
  LDI r8, 0
  LDI r5, 0x0F5DCB
  LDI r27, 0xAE03FC
  LDI r21, 3768
  LDI r7, 4034
  PUSH r23
  PUSH r4
  PUSH r5
  ADD r24, r15, r9
  DIV r5, r1, r10
  ADD r2, r9, r11
  AND r18, r10, r7
  POP r5
  POP r4
  POP r23
  SUB r15, r7, r3
  SHR r3, r14, r11
  XOR r15, r0, r8
  ADD r3, r9, r6
  DIV r14, r13, r12
  PUSH r3
  PUSH r6
  PUSH r2
  PUSH r21
  SUB r8, r15, r5
  MOD r12, r0, r3
  ADD r0, r2, r8
  SHL r1, r13, r8
  POP r21
  POP r2
  POP r6
  POP r3
  HALT
