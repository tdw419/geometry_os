; stack save/restore
; initialization
  LDI r18, 255
  LDI r7, 968
  LDI r14, 3080
  LDI r17, 0xECBCC8
  LDI r8, 3065
  LDI r10, 1
  LDI r3, 1612
  PUSH r7
  PUSH r11
  PUSH r6
  MUL r7, r4, r11
  MUL r21, r2, r15
  ADD r8, r6, r4
  POP r6
  POP r11
  POP r7
  SHL r5, r8, r1
  MOD r10, r4, r1
  ADD r6, r10, r4
  SHR r8, r16, r10
  SHL r2, r3, r5
  PUSH r10
  PUSH r4
  PUSH r10
  XOR r7, r3, r12
  MUL r9, r5, r15
  MOD r5, r9, r15
  POP r10
  POP r4
  POP r10
  HALT
