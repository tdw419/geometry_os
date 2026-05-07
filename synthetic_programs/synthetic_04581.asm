; stack save/restore
; initialization
  LDI r11, 0x8013CE
  LDI r2, 1719
  PUSH r14
  PUSH r29
  PUSH r7
  PUSH r6
  DIV r7, r8, r0
  AND r7, r11, r1
  SUB r6, r11, r10
  DIV r6, r12, r8
  XOR r3, r4, r7
  POP r6
  POP r7
  POP r29
  POP r14
  MOD r11, r14, r8
  DIV r8, r7, r10
  SHR r3, r13, r1
  PUSH r26
  PUSH r9
  PUSH r2
  PUSH r0
  SHR r8, r1, r23
  ADD r4, r1, r5
  AND r8, r1, r3
  SHL r0, r7, r27
  SHR r1, r2, r10
  POP r0
  POP r2
  POP r9
  POP r26
  HALT
