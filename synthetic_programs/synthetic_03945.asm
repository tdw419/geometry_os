; stack save/restore
; initialization
  LDI r2, 0x642D8E
  LDI r13, 0x8816C3
  PUSH r1
  PUSH r26
  PUSH r1
  AND r1, r5, r26
  XOR r1, r7, r11
  SHL r9, r7, r8
  SHR r1, r15, r21
  POP r1
  POP r26
  POP r1
  MOD r0, r1, r11
  MUL r6, r7, r15
  SHR r5, r11, r4
  PUSH r12
  PUSH r2
  PUSH r0
  SHR r9, r12, r7
  SHL r9, r15, r3
  XOR r14, r10, r3
  POP r0
  POP r2
  POP r12
  HALT
