; stack save/restore
; initialization
  LDI r3, 64
  LDI r13, 2
  LDI r11, 3700
  LDI r1, 0xB7EEFA
  LDI r15, 810
  PUSH r18
  PUSH r26
  PUSH r5
  SHL r14, r10, r3
  AND r5, r1, r24
  OR r14, r0, r9
  POP r5
  POP r26
  POP r18
  SHL r8, r5, r12
  OR r14, r4, r13
  MUL r14, r9, r8
  XOR r9, r11, r1
  SHL r4, r1, r7
  PUSH r11
  PUSH r7
  MUL r1, r4, r5
  SHR r14, r13, r3
  MOD r0, r9, r3
  SHL r3, r9, r14
  MUL r4, r7, r14
  POP r7
  POP r11
  HALT
