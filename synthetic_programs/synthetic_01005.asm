; stack save/restore
; initialization
  LDI r10, 32
  LDI r21, 128
  LDI r11, 10
  PUSH r10
  XOR r13, r6, r5
  ADD r13, r6, r10
  DIV r3, r6, r2
  XOR r5, r10, r4
  POP r10
  MUL r14, r10, r8
  DIV r13, r4, r31
  SHR r5, r11, r15
  OR r13, r11, r0
  OR r9, r0, r10
  DIV r5, r4, r3
  ADD r10, r14, r3
  XOR r14, r3, r1
  PUSH r8
  ADD r13, r17, r4
  OR r0, r6, r14
  POP r8
  HALT
