; stack save/restore
; initialization
  LDI r8, 2033
  LDI r11, 0x2CE725
  LDI r10, 0x7D2E02
  PUSH r1
  PUSH r5
  AND r9, r1, r11
  XOR r10, r0, r11
  POP r5
  POP r1
  AND r3, r4, r8
  XOR r3, r11, r2
  OR r3, r4, r11
  XOR r8, r28, r3
  PUSH r19
  PUSH r1
  PUSH r1
  PUSH r14
  MUL r18, r9, r2
  MUL r12, r6, r2
  POP r14
  POP r1
  POP r1
  POP r19
  HALT
