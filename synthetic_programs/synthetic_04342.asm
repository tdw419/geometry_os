; stack save/restore
; initialization
  LDI r1, 0xEB28B3
  LDI r7, 0x28AD92
  LDI r9, 0x263A1E
  LDI r15, 0x21F2D7
  LDI r21, 16
  LDI r6, 4
  LDI r13, 2571
  LDI r10, 0x9A8CC8
  PUSH r0
  PUSH r22
  MUL r2, r11, r9
  MOD r12, r0, r13
  POP r22
  POP r0
  MOD r6, r14, r10
  AND r14, r10, r3
  XOR r13, r3, r7
  SHR r0, r4, r30
  OR r8, r9, r3
  SHL r3, r6, r15
  SHL r14, r12, r13
  PUSH r1
  PUSH r14
  PUSH r6
  PUSH r11
  AND r6, r7, r3
  MUL r4, r9, r3
  POP r11
  POP r6
  POP r14
  POP r1
  HALT
