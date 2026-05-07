; stack save/restore
; initialization
  LDI r10, 1
  LDI r11, 256
  LDI r14, 2128
  LDI r8, 0xEA26D0
  PUSH r9
  PUSH r3
  PUSH r1
  PUSH r3
  SHL r11, r8, r6
  AND r8, r15, r7
  DIV r6, r11, r8
  MUL r10, r0, r9
  POP r3
  POP r1
  POP r3
  POP r9
  SUB r10, r15, r4
  SUB r4, r1, r14
  DIV r4, r14, r1
  PUSH r1
  PUSH r11
  PUSH r10
  PUSH r26
  SHR r14, r2, r15
  OR r1, r6, r2
  OR r31, r13, r3
  POP r26
  POP r10
  POP r11
  POP r1
  HALT
