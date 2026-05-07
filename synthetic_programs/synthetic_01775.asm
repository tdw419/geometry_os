; stack save/restore
; initialization
  LDI r8, 0
  LDI r12, 0xA96740
  LDI r0, 0x0ABBB8
  LDI r2, 64
  PUSH r10
  PUSH r27
  PUSH r8
  PUSH r8
  SHR r8, r9, r6
  AND r13, r6, r4
  ADD r5, r1, r8
  POP r8
  POP r8
  POP r27
  POP r10
  OR r1, r12, r2
  AND r9, r0, r1
  DIV r14, r10, r6
  SHL r8, r1, r9
  PUSH r2
  PUSH r0
  MUL r5, r22, r6
  OR r9, r10, r6
  AND r13, r6, r11
  POP r0
  POP r2
  HALT
