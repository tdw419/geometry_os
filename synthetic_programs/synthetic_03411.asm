; stack save/restore
; initialization
  LDI r6, 3176
  LDI r11, 0x84A523
  PUSH r3
  PUSH r8
  PUSH r5
  PUSH r16
  OR r3, r5, r1
  SHR r3, r0, r2
  SHR r7, r14, r11
  POP r16
  POP r5
  POP r8
  POP r3
  ADD r5, r3, r8
  MUL r4, r10, r12
  MUL r14, r12, r8
  XOR r13, r0, r15
  SHR r6, r13, r8
  DIV r13, r14, r11
  SUB r10, r29, r4
  PUSH r5
  PUSH r4
  PUSH r28
  PUSH r5
  DIV r7, r15, r10
  MOD r2, r7, r14
  AND r1, r7, r18
  XOR r13, r12, r10
  POP r5
  POP r28
  POP r4
  POP r5
  HALT
