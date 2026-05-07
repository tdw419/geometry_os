; stack save/restore
; initialization
  LDI r11, 0xC47763
  LDI r8, 0x217F62
  LDI r6, 128
  LDI r9, 0x4C2F06
  LDI r12, 256
  LDI r13, 0x998D89
  LDI r7, 32
  LDI r5, 0x5A6AAA
  PUSH r4
  PUSH r10
  PUSH r8
  PUSH r0
  MUL r27, r15, r0
  DIV r13, r6, r3
  AND r1, r3, r6
  ADD r10, r14, r8
  POP r0
  POP r8
  POP r10
  POP r4
  XOR r12, r13, r8
  AND r3, r0, r13
  XOR r8, r2, r6
  OR r14, r12, r11
  SHR r10, r13, r3
  PUSH r9
  PUSH r5
  PUSH r6
  PUSH r27
  XOR r0, r8, r13
  SHR r7, r9, r8
  MUL r13, r5, r14
  SUB r1, r10, r7
  OR r15, r5, r9
  POP r27
  POP r6
  POP r5
  POP r9
  HALT
