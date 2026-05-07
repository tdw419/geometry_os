; stack save/restore
; initialization
  LDI r29, 0xF27F1A
  LDI r7, 0x3A5464
  LDI r4, 3760
  LDI r6, 2982
  LDI r1, 255
  PUSH r9
  SHR r13, r12, r2
  SUB r16, r7, r11
  POP r9
  OR r1, r13, r10
  ADD r8, r12, r7
  MUL r10, r7, r9
  SHL r10, r6, r2
  XOR r0, r4, r1
  ADD r9, r3, r11
  PUSH r6
  PUSH r6
  PUSH r12
  SHL r3, r24, r11
  SHL r28, r2, r10
  POP r12
  POP r6
  POP r6
  HALT
