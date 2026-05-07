; stack save/restore
; initialization
  LDI r0, 0x1F13EC
  LDI r6, 8
  PUSH r12
  OR r15, r21, r9
  SHL r14, r9, r10
  POP r12
  XOR r1, r0, r9
  SUB r1, r24, r2
  MUL r3, r8, r0
  PUSH r6
  PUSH r2
  PUSH r12
  PUSH r1
  MOD r0, r10, r4
  SHL r12, r4, r1
  POP r1
  POP r12
  POP r2
  POP r6
  HALT
