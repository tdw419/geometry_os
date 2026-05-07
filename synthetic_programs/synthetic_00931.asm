; stack save/restore
; initialization
  LDI r24, 32
  LDI r6, 16
  LDI r0, 16
  LDI r8, 0xE37F20
  LDI r2, 2648
  LDI r11, 64
  LDI r21, 835
  LDI r4, 0xC47340
  PUSH r1
  PUSH r7
  MUL r5, r2, r8
  ADD r2, r9, r8
  MUL r13, r11, r12
  XOR r2, r7, r5
  AND r2, r0, r15
  POP r7
  POP r1
  MOD r3, r12, r6
  SHL r13, r15, r7
  MUL r4, r10, r5
  SHR r3, r11, r15
  SHL r3, r11, r5
  OR r4, r5, r2
  SHL r2, r10, r1
  PUSH r9
  SHR r3, r11, r12
  MUL r4, r12, r5
  SHL r5, r29, r8
  XOR r8, r9, r6
  SHL r10, r0, r6
  POP r9
  HALT
