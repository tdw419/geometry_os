; stack save/restore
; initialization
  LDI r7, 256
  LDI r2, 256
  LDI r14, 2
  LDI r15, 2
  LDI r5, 0xF02DBE
  LDI r6, 2
  PUSH r14
  OR r10, r13, r8
  SUB r24, r18, r4
  SHL r15, r7, r6
  OR r5, r11, r9
  POP r14
  SHL r7, r0, r6
  SHR r1, r4, r8
  DIV r3, r5, r10
  SHL r7, r11, r2
  OR r7, r9, r11
  SHR r11, r1, r8
  PUSH r14
  PUSH r2
  PUSH r11
  PUSH r9
  SHL r8, r11, r5
  MUL r9, r8, r30
  DIV r7, r3, r15
  POP r9
  POP r11
  POP r2
  POP r14
  HALT
