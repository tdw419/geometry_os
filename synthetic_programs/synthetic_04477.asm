; stack save/restore
; initialization
  LDI r9, 256
  LDI r2, 3452
  PUSH r4
  PUSH r24
  PUSH r4
  XOR r27, r9, r15
  XOR r9, r3, r18
  POP r4
  POP r24
  POP r4
  ADD r10, r17, r2
  SHL r5, r11, r9
  OR r9, r4, r11
  PUSH r12
  PUSH r4
  PUSH r6
  PUSH r13
  AND r15, r11, r5
  DIV r19, r6, r12
  POP r13
  POP r6
  POP r4
  POP r12
  HALT
