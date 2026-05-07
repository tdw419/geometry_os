; stack save/restore
; initialization
  LDI r11, 2
  LDI r2, 0x513730
  LDI r1, 0
  LDI r5, 16
  LDI r10, 0xF6310B
  PUSH r27
  PUSH r7
  PUSH r13
  DIV r1, r11, r0
  SUB r5, r10, r0
  AND r22, r14, r10
  XOR r13, r12, r2
  AND r3, r4, r5
  POP r13
  POP r7
  POP r27
  SHR r4, r10, r11
  XOR r3, r7, r2
  MUL r9, r10, r5
  SUB r1, r0, r2
  PUSH r10
  PUSH r10
  PUSH r14
  MOD r10, r5, r13
  AND r9, r7, r13
  SUB r10, r0, r16
  SHL r24, r6, r13
  SHL r11, r3, r10
  POP r14
  POP r10
  POP r10
  HALT
