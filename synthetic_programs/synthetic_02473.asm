; stack save/restore
; initialization
  LDI r12, 0x25538D
  LDI r4, 3225
  LDI r15, 10
  LDI r5, 0x3CA609
  LDI r27, 1292
  LDI r3, 16
  LDI r14, 0xFDC253
  LDI r7, 0x31092B
  PUSH r2
  PUSH r9
  PUSH r6
  OR r17, r4, r5
  OR r11, r14, r0
  SHR r10, r6, r9
  POP r6
  POP r9
  POP r2
  DIV r13, r9, r11
  XOR r7, r3, r5
  OR r9, r12, r1
  AND r12, r1, r5
  SHL r7, r1, r9
  AND r15, r3, r9
  DIV r15, r3, r6
  PUSH r10
  MUL r21, r15, r2
  ADD r6, r12, r14
  SUB r10, r9, r6
  SHL r12, r0, r14
  AND r15, r12, r13
  POP r10
  HALT
