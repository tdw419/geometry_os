; stack save/restore
; initialization
  LDI r0, 0xD4DC10
  LDI r12, 32
  LDI r1, 1679
  LDI r8, 0x99A181
  LDI r11, 0x681616
  LDI r13, 10
  LDI r3, 1
  LDI r15, 0x74A5F7
  PUSH r1
  PUSH r8
  XOR r7, r4, r10
  OR r5, r8, r10
  SUB r13, r2, r19
  ADD r13, r4, r11
  POP r8
  POP r1
  ADD r2, r6, r1
  SUB r6, r13, r11
  AND r8, r6, r14
  PUSH r5
  PUSH r13
  PUSH r9
  MUL r11, r13, r1
  ADD r8, r9, r10
  POP r9
  POP r13
  POP r5
  HALT
