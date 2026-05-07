; stack save/restore
; initialization
  LDI r13, 4
  LDI r10, 0
  LDI r2, 683
  LDI r8, 4
  LDI r3, 255
  LDI r9, 0x9B1BCA
  LDI r1, 0xA72EFC
  PUSH r5
  MOD r12, r13, r1
  SUB r13, r15, r22
  POP r5
  SHR r7, r2, r1
  SUB r13, r0, r9
  ADD r6, r13, r3
  OR r18, r7, r19
  SUB r11, r22, r9
  ADD r3, r11, r0
  PUSH r12
  PUSH r1
  PUSH r11
  OR r0, r14, r10
  AND r4, r11, r10
  AND r13, r10, r7
  OR r12, r1, r22
  POP r11
  POP r1
  POP r12
  HALT
