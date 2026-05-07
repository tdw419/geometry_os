; stack save/restore
; initialization
  LDI r9, 256
  LDI r12, 0x7583D5
  LDI r13, 230
  LDI r0, 2
  LDI r7, 0xBE1418
  LDI r3, 0x137886
  LDI r11, 0x9F08BE
  PUSH r6
  PUSH r0
  PUSH r12
  PUSH r21
  SHL r9, r8, r6
  DIV r2, r6, r15
  DIV r3, r29, r14
  POP r21
  POP r12
  POP r0
  POP r6
  AND r8, r4, r15
  XOR r8, r11, r5
  AND r0, r3, r7
  ADD r2, r7, r3
  SHL r14, r15, r1
  SHL r4, r15, r13
  DIV r11, r6, r1
  PUSH r28
  PUSH r15
  PUSH r0
  AND r5, r11, r12
  SHL r2, r3, r4
  POP r0
  POP r15
  POP r28
  HALT
