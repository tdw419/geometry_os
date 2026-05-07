; stack save/restore
; initialization
  LDI r3, 0xCD3FAD
  LDI r1, 1803
  LDI r15, 1263
  LDI r11, 256
  LDI r4, 0x8B9CCB
  LDI r7, 0x390808
  PUSH r1
  PUSH r1
  PUSH r21
  XOR r2, r12, r10
  ADD r13, r3, r5
  SHR r13, r9, r6
  SUB r9, r11, r15
  POP r21
  POP r1
  POP r1
  XOR r11, r5, r7
  XOR r12, r6, r29
  DIV r9, r2, r0
  MUL r6, r21, r7
  AND r6, r13, r2
  MUL r7, r1, r2
  PUSH r24
  PUSH r5
  PUSH r5
  PUSH r11
  SHL r8, r1, r6
  MOD r0, r6, r3
  ADD r6, r10, r9
  MOD r3, r9, r6
  DIV r11, r9, r4
  POP r11
  POP r5
  POP r5
  POP r24
  HALT
