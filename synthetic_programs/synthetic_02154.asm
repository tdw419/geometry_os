; stack save/restore
; initialization
  LDI r8, 2
  LDI r1, 255
  LDI r13, 256
  LDI r7, 0x2847F6
  LDI r14, 1234
  LDI r6, 32
  LDI r10, 2631
  PUSH r10
  PUSH r15
  PUSH r20
  MOD r5, r14, r0
  AND r11, r1, r3
  POP r20
  POP r15
  POP r10
  MUL r13, r11, r0
  SUB r0, r2, r9
  MUL r13, r5, r1
  OR r5, r6, r14
  ADD r9, r4, r2
  SHR r6, r14, r11
  PUSH r2
  PUSH r7
  AND r8, r5, r13
  OR r7, r15, r5
  MOD r13, r5, r4
  SUB r12, r14, r0
  ADD r12, r5, r4
  POP r7
  POP r2
  HALT
