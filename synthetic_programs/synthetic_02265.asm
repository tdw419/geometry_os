; stack save/restore
; initialization
  LDI r27, 64
  LDI r6, 0
  LDI r5, 60
  LDI r12, 3111
  LDI r9, 255
  LDI r11, 2059
  PUSH r0
  SHL r7, r13, r15
  SHR r7, r0, r10
  SHL r15, r11, r0
  AND r10, r2, r8
  POP r0
  DIV r9, r1, r7
  SHL r12, r7, r13
  OR r1, r18, r7
  PUSH r11
  PUSH r0
  PUSH r1
  PUSH r20
  OR r9, r10, r15
  ADD r7, r8, r1
  SHL r9, r0, r3
  SHL r14, r5, r8
  SHL r11, r9, r3
  POP r20
  POP r1
  POP r0
  POP r11
  HALT
