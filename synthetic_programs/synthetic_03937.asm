; stack save/restore
; initialization
  LDI r1, 128
  LDI r11, 2863
  LDI r0, 19
  LDI r14, 1571
  LDI r2, 528
  PUSH r3
  PUSH r7
  PUSH r3
  PUSH r6
  MUL r10, r6, r3
  MUL r9, r1, r4
  XOR r6, r9, r14
  OR r3, r12, r13
  SUB r1, r13, r9
  POP r6
  POP r3
  POP r7
  POP r3
  SUB r9, r6, r2
  MUL r10, r12, r3
  XOR r7, r5, r13
  PUSH r10
  PUSH r7
  PUSH r13
  PUSH r3
  SHR r0, r8, r9
  SHL r5, r15, r9
  SHL r10, r8, r14
  XOR r2, r13, r1
  POP r3
  POP r13
  POP r7
  POP r10
  HALT
