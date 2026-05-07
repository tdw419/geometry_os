; stack save/restore
; initialization
  LDI r12, 3075
  LDI r13, 0xAE59C4
  LDI r1, 2528
  LDI r14, 0xFE4736
  LDI r5, 0xB33019
  LDI r2, 1
  LDI r7, 0xE63238
  LDI r0, 2205
  PUSH r5
  PUSH r14
  OR r11, r0, r28
  DIV r7, r11, r2
  SUB r8, r13, r2
  ADD r8, r6, r14
  DIV r0, r7, r6
  POP r14
  POP r5
  DIV r16, r1, r13
  OR r3, r9, r8
  SHL r2, r13, r11
  XOR r0, r9, r6
  DIV r2, r0, r14
  PUSH r13
  PUSH r13
  PUSH r4
  ADD r7, r5, r4
  DIV r0, r27, r1
  DIV r11, r8, r1
  ADD r23, r9, r0
  POP r4
  POP r13
  POP r13
  HALT
