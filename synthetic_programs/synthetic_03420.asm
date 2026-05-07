; stack save/restore
; initialization
  LDI r6, 0
  LDI r12, 0x365EFC
  LDI r13, 32
  LDI r7, 0xB0EF31
  PUSH r15
  PUSH r5
  PUSH r12
  MOD r12, r26, r1
  XOR r13, r7, r18
  OR r8, r7, r5
  DIV r26, r3, r9
  POP r12
  POP r5
  POP r15
  AND r12, r5, r9
  MOD r13, r12, r14
  SHL r14, r11, r6
  DIV r3, r26, r6
  ADD r7, r6, r14
  MUL r6, r5, r1
  XOR r2, r3, r1
  AND r7, r31, r8
  PUSH r8
  PUSH r5
  PUSH r9
  XOR r15, r6, r14
  OR r19, r0, r3
  POP r9
  POP r5
  POP r8
  HALT
