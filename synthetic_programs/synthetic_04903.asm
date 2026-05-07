; stack save/restore
; initialization
  LDI r0, 0x2D3870
  LDI r3, 256
  LDI r1, 128
  PUSH r1
  MUL r10, r3, r2
  MUL r6, r8, r1
  OR r13, r9, r2
  POP r1
  SHL r13, r8, r2
  SHR r29, r15, r0
  SHR r0, r4, r9
  SUB r2, r15, r3
  PUSH r0
  DIV r5, r14, r0
  OR r15, r7, r13
  SUB r3, r14, r26
  DIV r6, r11, r5
  MUL r7, r3, r14
  POP r0
  HALT
