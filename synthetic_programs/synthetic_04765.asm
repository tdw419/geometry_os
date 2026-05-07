; stack save/restore
; initialization
  LDI r13, 0x28A2F3
  LDI r6, 169
  LDI r11, 0xF2E901
  LDI r15, 2252
  PUSH r11
  PUSH r14
  PUSH r6
  DIV r4, r8, r6
  DIV r11, r6, r1
  SHR r14, r12, r5
  POP r6
  POP r14
  POP r11
  MOD r4, r5, r14
  MOD r4, r7, r10
  OR r3, r14, r8
  SUB r20, r17, r7
  MUL r7, r10, r3
  PUSH r12
  PUSH r11
  PUSH r11
  AND r10, r31, r7
  ADD r0, r5, r4
  XOR r3, r9, r15
  POP r11
  POP r11
  POP r12
  HALT
