; stack save/restore
; initialization
  LDI r2, 256
  LDI r15, 128
  LDI r11, 0x0BA006
  LDI r7, 128
  PUSH r21
  PUSH r1
  PUSH r3
  PUSH r14
  SHL r15, r7, r5
  MOD r5, r0, r14
  POP r14
  POP r3
  POP r1
  POP r21
  SHL r9, r13, r8
  OR r2, r5, r13
  DIV r4, r14, r6
  OR r12, r8, r11
  XOR r13, r20, r23
  DIV r16, r2, r11
  PUSH r5
  PUSH r5
  PUSH r0
  PUSH r12
  MOD r4, r5, r14
  ADD r14, r8, r10
  SHR r12, r10, r8
  POP r12
  POP r0
  POP r5
  POP r5
  HALT
