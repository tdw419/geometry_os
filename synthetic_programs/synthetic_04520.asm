; stack save/restore
; initialization
  LDI r7, 32
  LDI r15, 128
  PUSH r8
  PUSH r14
  DIV r1, r15, r0
  DIV r0, r21, r9
  POP r14
  POP r8
  MOD r3, r15, r5
  XOR r12, r2, r9
  XOR r12, r4, r5
  OR r0, r13, r12
  MUL r0, r10, r13
  MOD r6, r0, r3
  PUSH r3
  PUSH r16
  PUSH r1
  PUSH r1
  SHR r1, r25, r2
  SHR r6, r11, r29
  OR r6, r28, r1
  SUB r7, r1, r13
  MUL r14, r12, r8
  POP r1
  POP r1
  POP r16
  POP r3
  HALT
