; stack save/restore
; initialization
  LDI r4, 0x6C96D4
  LDI r0, 128
  LDI r10, 1
  LDI r11, 0x194C35
  LDI r6, 102
  LDI r12, 0xFC0784
  LDI r8, 0x585EE0
  LDI r14, 0x5A9914
  PUSH r5
  XOR r4, r15, r2
  SHR r8, r3, r4
  POP r5
  OR r0, r15, r29
  OR r5, r15, r7
  DIV r1, r5, r7
  SHL r4, r9, r15
  OR r7, r12, r14
  PUSH r8
  PUSH r12
  PUSH r13
  XOR r7, r4, r3
  ADD r10, r15, r9
  POP r13
  POP r12
  POP r8
  HALT
