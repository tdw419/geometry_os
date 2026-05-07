; stack save/restore
; initialization
  LDI r13, 0xF52646
  LDI r6, 16
  LDI r9, 3711
  LDI r8, 256
  LDI r10, 32
  LDI r2, 3455
  LDI r5, 128
  PUSH r8
  DIV r6, r10, r15
  MOD r12, r5, r6
  POP r8
  OR r13, r11, r25
  ADD r12, r14, r1
  SUB r5, r2, r14
  ADD r21, r13, r5
  OR r2, r4, r1
  OR r5, r6, r0
  ADD r29, r15, r4
  DIV r14, r12, r4
  PUSH r7
  PUSH r7
  PUSH r13
  XOR r3, r14, r10
  MOD r13, r6, r11
  SUB r15, r13, r1
  POP r13
  POP r7
  POP r7
  HALT
