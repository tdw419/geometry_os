; stack save/restore
; initialization
  LDI r13, 2791
  LDI r14, 0x0E52AC
  LDI r4, 4
  LDI r11, 0x99C75F
  PUSH r15
  PUSH r8
  PUSH r11
  OR r10, r25, r4
  SHL r10, r13, r2
  SUB r15, r4, r6
  POP r11
  POP r8
  POP r15
  SHL r9, r14, r12
  MOD r1, r6, r4
  MOD r10, r1, r16
  SUB r14, r2, r8
  MUL r9, r5, r11
  PUSH r10
  PUSH r13
  PUSH r11
  SHR r2, r9, r4
  SUB r11, r13, r10
  SUB r7, r10, r4
  POP r11
  POP r13
  POP r10
  HALT
