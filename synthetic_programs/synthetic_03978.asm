; stack save/restore
; initialization
  LDI r4, 0x0AF456
  LDI r5, 0x90DADD
  LDI r14, 0xAEB7C8
  LDI r11, 8
  LDI r10, 0x5DEBC9
  LDI r15, 10
  LDI r8, 255
  LDI r6, 0xFAB98B
  PUSH r15
  PUSH r5
  PUSH r13
  PUSH r1
  DIV r8, r4, r13
  AND r3, r13, r4
  POP r1
  POP r13
  POP r5
  POP r15
  SHL r5, r8, r30
  AND r9, r8, r3
  DIV r11, r1, r14
  ADD r2, r4, r15
  DIV r14, r8, r3
  PUSH r3
  PUSH r14
  PUSH r9
  MOD r0, r8, r29
  MOD r24, r4, r15
  ADD r4, r11, r1
  DIV r15, r2, r9
  POP r9
  POP r14
  POP r3
  HALT
