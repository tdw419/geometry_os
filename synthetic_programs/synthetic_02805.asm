; stack save/restore
; initialization
  LDI r15, 0x6D4E9F
  LDI r2, 64
  PUSH r1
  MUL r15, r3, r4
  SHR r4, r9, r0
  AND r2, r15, r0
  MOD r1, r14, r16
  POP r1
  ADD r9, r3, r5
  SUB r4, r11, r1
  ADD r18, r15, r2
  SHR r11, r9, r0
  SUB r9, r1, r5
  PUSH r8
  PUSH r9
  PUSH r4
  PUSH r11
  SUB r29, r2, r3
  SHR r6, r5, r7
  SHL r14, r10, r11
  XOR r12, r11, r29
  ADD r10, r8, r14
  POP r11
  POP r4
  POP r9
  POP r8
  HALT
