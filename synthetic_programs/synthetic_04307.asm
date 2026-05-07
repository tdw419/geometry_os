; stack save/restore
; initialization
  LDI r7, 128
  LDI r11, 0xDBE6A2
  LDI r14, 1370
  LDI r15, 32
  LDI r1, 256
  LDI r13, 4
  LDI r8, 365
  LDI r12, 0
  PUSH r5
  MOD r13, r0, r2
  MOD r13, r2, r0
  SHL r2, r0, r8
  SHR r11, r1, r3
  SHR r4, r8, r15
  POP r5
  OR r7, r15, r3
  SHL r6, r9, r10
  AND r6, r4, r9
  XOR r5, r4, r2
  ADD r8, r14, r29
  PUSH r1
  PUSH r7
  SHR r3, r11, r10
  MOD r2, r1, r5
  POP r7
  POP r1
  HALT
