; stack save/restore
; initialization
  LDI r3, 128
  LDI r15, 0xE9EA57
  LDI r5, 0
  LDI r8, 3874
  LDI r9, 1
  PUSH r0
  PUSH r9
  PUSH r10
  SUB r15, r12, r0
  SHL r15, r11, r0
  SHR r7, r11, r15
  POP r10
  POP r9
  POP r0
  OR r0, r9, r14
  SUB r11, r14, r7
  AND r12, r8, r10
  PUSH r7
  DIV r22, r2, r8
  MUL r8, r5, r9
  SHR r6, r7, r10
  POP r7
  HALT
