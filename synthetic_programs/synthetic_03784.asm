; stack save/restore
; initialization
  LDI r9, 192
  LDI r6, 0x6E235A
  PUSH r15
  PUSH r14
  PUSH r9
  SHL r9, r0, r6
  OR r3, r1, r8
  DIV r3, r15, r5
  OR r4, r15, r1
  POP r9
  POP r14
  POP r15
  MUL r4, r15, r11
  OR r11, r8, r5
  ADD r14, r11, r0
  ADD r11, r6, r0
  MOD r13, r6, r5
  OR r0, r9, r12
  PUSH r13
  SUB r9, r3, r19
  ADD r2, r14, r8
  SUB r15, r12, r4
  XOR r14, r13, r7
  OR r4, r12, r3
  POP r13
  HALT
