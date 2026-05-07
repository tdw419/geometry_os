; stack save/restore
; initialization
  LDI r7, 0
  LDI r8, 255
  LDI r15, 0x10A93E
  LDI r3, 2
  LDI r4, 16
  PUSH r5
  PUSH r14
  PUSH r4
  SHR r31, r12, r0
  SUB r15, r4, r25
  SHR r2, r4, r7
  POP r4
  POP r14
  POP r5
  SHL r12, r8, r14
  SHR r4, r8, r9
  SHL r6, r12, r5
  SHR r0, r5, r10
  PUSH r6
  PUSH r0
  PUSH r9
  PUSH r6
  MOD r14, r0, r9
  SHR r13, r3, r1
  MOD r6, r11, r7
  POP r6
  POP r9
  POP r0
  POP r6
  HALT
