; stack save/restore
; initialization
  LDI r3, 210
  LDI r11, 4
  LDI r14, 0x914989
  LDI r0, 3400
  LDI r10, 0xF93214
  LDI r7, 256
  LDI r4, 0
  PUSH r3
  PUSH r7
  PUSH r8
  XOR r7, r3, r14
  ADD r7, r0, r1
  AND r1, r2, r4
  DIV r0, r4, r6
  XOR r10, r31, r6
  POP r8
  POP r7
  POP r3
  XOR r12, r9, r31
  XOR r5, r14, r11
  OR r15, r22, r6
  ADD r1, r12, r7
  OR r14, r3, r5
  PUSH r1
  PUSH r6
  PUSH r1
  MUL r2, r9, r0
  AND r11, r0, r8
  DIV r4, r3, r1
  DIV r5, r14, r1
  SHL r1, r5, r11
  POP r1
  POP r6
  POP r1
  HALT
