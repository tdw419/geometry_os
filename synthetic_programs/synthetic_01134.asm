; stack save/restore
; initialization
  LDI r6, 1904
  LDI r11, 0xFAC9B6
  LDI r8, 1966
  LDI r10, 0x1C08EB
  PUSH r11
  DIV r9, r0, r3
  AND r15, r1, r12
  OR r0, r6, r14
  SHR r7, r13, r15
  MOD r5, r11, r9
  POP r11
  MOD r2, r11, r10
  MUL r6, r27, r4
  DIV r9, r30, r12
  SHL r10, r9, r11
  PUSH r1
  PUSH r6
  AND r15, r9, r4
  SHR r11, r6, r5
  XOR r9, r10, r14
  POP r6
  POP r1
  HALT
