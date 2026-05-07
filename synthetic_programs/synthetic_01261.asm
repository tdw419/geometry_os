; stack save/restore
; initialization
  LDI r14, 0x78C125
  LDI r10, 3506
  LDI r11, 3278
  LDI r0, 0x037EA0
  LDI r12, 0x5E3F4F
  LDI r15, 0x1D1CB1
  PUSH r7
  PUSH r8
  PUSH r1
  DIV r1, r12, r2
  MOD r0, r1, r2
  MOD r0, r6, r11
  SUB r7, r15, r3
  SHL r1, r5, r8
  POP r1
  POP r8
  POP r7
  SUB r13, r4, r6
  AND r15, r0, r10
  SHL r8, r0, r11
  PUSH r6
  MUL r8, r5, r7
  XOR r9, r12, r2
  POP r6
  HALT
