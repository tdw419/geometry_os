; stack save/restore
; initialization
  LDI r3, 0x7A1630
  LDI r5, 0x7D110F
  LDI r4, 32
  LDI r7, 0x700D74
  LDI r11, 0xE6F2AD
  LDI r16, 0xE04F89
  LDI r15, 8
  PUSH r2
  PUSH r4
  DIV r15, r5, r8
  MOD r13, r3, r7
  DIV r13, r8, r3
  SHL r15, r1, r10
  POP r4
  POP r2
  SHR r4, r27, r6
  DIV r9, r7, r12
  MOD r7, r11, r6
  PUSH r11
  XOR r12, r1, r0
  SUB r1, r9, r6
  POP r11
  HALT
