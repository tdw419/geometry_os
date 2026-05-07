; stack save/restore
; initialization
  LDI r8, 0xEB5075
  LDI r0, 8
  LDI r7, 10
  LDI r12, 1306
  LDI r10, 32
  LDI r13, 255
  LDI r9, 8
  PUSH r5
  SUB r2, r13, r18
  MOD r14, r10, r3
  POP r5
  SHR r7, r3, r0
  XOR r14, r3, r9
  MUL r2, r4, r6
  MUL r11, r9, r10
  MOD r10, r7, r5
  OR r5, r8, r13
  PUSH r7
  PUSH r7
  PUSH r14
  SHR r14, r13, r15
  SUB r11, r15, r0
  XOR r6, r15, r10
  ADD r6, r2, r3
  OR r12, r2, r3
  POP r14
  POP r7
  POP r7
  HALT
