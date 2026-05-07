; stack save/restore
; initialization
  LDI r15, 3248
  LDI r7, 0xD67067
  LDI r11, 2
  LDI r12, 64
  LDI r3, 32
  LDI r23, 128
  LDI r13, 0x74449B
  LDI r0, 2228
  PUSH r4
  PUSH r5
  PUSH r20
  PUSH r9
  DIV r6, r2, r11
  XOR r1, r0, r12
  OR r4, r12, r6
  SHR r11, r7, r1
  POP r9
  POP r20
  POP r5
  POP r4
  OR r13, r4, r11
  SHR r24, r9, r11
  SHL r13, r4, r0
  XOR r11, r15, r12
  OR r14, r10, r2
  ADD r1, r0, r4
  SHL r27, r11, r14
  SHR r2, r14, r9
  PUSH r4
  XOR r22, r1, r0
  OR r15, r4, r5
  MOD r14, r12, r29
  SUB r15, r0, r2
  POP r4
  HALT
