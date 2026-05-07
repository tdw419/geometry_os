; stack save/restore
; initialization
  LDI r8, 0x4EFFFE
  LDI r11, 0x14A900
  LDI r2, 186
  LDI r0, 64
  LDI r10, 0x45A63A
  LDI r9, 256
  PUSH r12
  PUSH r9
  SHL r12, r9, r3
  MUL r1, r12, r6
  OR r14, r9, r1
  POP r9
  POP r12
  DIV r11, r1, r5
  OR r13, r8, r14
  ADD r1, r10, r5
  PUSH r14
  OR r6, r11, r2
  SHL r24, r10, r6
  ADD r13, r4, r15
  MOD r7, r4, r12
  POP r14
  HALT
