; stack save/restore
; initialization
  LDI r5, 8
  LDI r10, 715
  LDI r8, 250
  LDI r17, 8
  LDI r12, 16
  LDI r2, 0xA79719
  LDI r11, 64
  LDI r6, 0x2CD3D5
  PUSH r13
  PUSH r0
  PUSH r15
  PUSH r13
  SHR r1, r10, r9
  MOD r13, r6, r9
  POP r13
  POP r15
  POP r0
  POP r13
  SUB r12, r0, r15
  MUL r11, r7, r8
  AND r9, r11, r6
  SHL r3, r15, r2
  PUSH r15
  PUSH r15
  PUSH r16
  PUSH r13
  ADD r4, r15, r10
  MUL r25, r23, r10
  XOR r11, r28, r13
  DIV r2, r5, r7
  SHL r7, r4, r12
  POP r13
  POP r16
  POP r15
  POP r15
  HALT
