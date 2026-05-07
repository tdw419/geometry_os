; stack save/restore
; initialization
  LDI r0, 3561
  LDI r10, 294
  LDI r2, 16
  LDI r13, 0xE6A024
  LDI r5, 493
  LDI r3, 8
  LDI r11, 859
  LDI r12, 0x6DEA94
  PUSH r9
  PUSH r1
  PUSH r0
  XOR r15, r9, r7
  DIV r11, r7, r0
  AND r8, r12, r5
  SHL r9, r15, r13
  DIV r7, r8, r15
  POP r0
  POP r1
  POP r9
  MOD r9, r0, r5
  SUB r10, r7, r11
  DIV r6, r9, r0
  MUL r9, r10, r2
  PUSH r0
  PUSH r0
  PUSH r14
  PUSH r4
  OR r5, r8, r12
  SUB r8, r15, r0
  DIV r28, r14, r11
  POP r4
  POP r14
  POP r0
  POP r0
  HALT
