; stack save/restore
; initialization
  LDI r6, 0x1690DB
  LDI r1, 0xE8FCE2
  LDI r15, 0xED0E03
  PUSH r2
  PUSH r7
  SUB r5, r2, r3
  SUB r10, r0, r8
  ADD r14, r2, r10
  XOR r9, r3, r6
  POP r7
  POP r2
  SHR r3, r1, r5
  SUB r15, r4, r11
  MOD r5, r0, r8
  PUSH r0
  PUSH r14
  PUSH r1
  PUSH r15
  XOR r24, r0, r25
  AND r11, r15, r5
  POP r15
  POP r1
  POP r14
  POP r0
  HALT
