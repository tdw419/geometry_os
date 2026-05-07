; stack save/restore
; initialization
  LDI r11, 0x5D1ED9
  LDI r15, 0x800ED9
  LDI r12, 8
  LDI r4, 0
  LDI r14, 0
  LDI r0, 3809
  PUSH r6
  PUSH r0
  PUSH r7
  OR r10, r4, r1
  SUB r6, r3, r11
  POP r7
  POP r0
  POP r6
  AND r3, r10, r1
  MOD r11, r4, r7
  XOR r5, r4, r13
  MUL r31, r5, r6
  PUSH r5
  PUSH r31
  PUSH r8
  XOR r9, r5, r2
  SHL r13, r10, r11
  POP r8
  POP r31
  POP r5
  HALT
