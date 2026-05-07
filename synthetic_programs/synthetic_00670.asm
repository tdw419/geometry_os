; stack save/restore
; initialization
  LDI r7, 2798
  LDI r4, 0x82ABDD
  LDI r10, 16
  LDI r6, 4
  LDI r11, 256
  LDI r8, 8
  LDI r15, 2406
  LDI r3, 84
  PUSH r3
  PUSH r2
  MOD r4, r6, r2
  ADD r15, r11, r6
  POP r2
  POP r3
  OR r3, r1, r12
  SUB r9, r5, r0
  DIV r11, r9, r3
  DIV r5, r15, r7
  SUB r10, r7, r12
  SHL r7, r15, r2
  DIV r8, r9, r7
  PUSH r9
  SHR r5, r12, r4
  XOR r14, r10, r9
  ADD r15, r5, r1
  OR r9, r8, r10
  OR r8, r6, r12
  POP r9
  HALT
