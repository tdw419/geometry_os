; mixed program
; initialization
  LDI r5, 1153
  LDI r3, 1897
  LDI r1, 2382
  LDI r12, 607
; palette
  LDI r4, 0x60BF
  LDI r6, 1
  LDI r7, 0x44FF00
  STORE r4, r7
  ADD r4, r4, r6
  LDI r7, 0x00FF44
  STORE r4, r7
  ADD r4, r4, r6
  LDI r7, 0x000000
  STORE r4, r7
  ADD r4, r4, r6
  LDI r7, 0x00FF44
  STORE r4, r7
  ADD r4, r4, r6
  LDI r7, 0xFF0000
  STORE r4, r7
  ADD r4, r4, r6
  PUSH r15
  SUB r5, r0, r9
  OR r1, r14, r15
  DIV r13, r7, r1
  AND r2, r0, r14
  POP r15
  AND r4, r0, r2
  XOR r4, r0, r10
  OR r12, r11, r1
  AND r4, r13, r10
  OR r15, r6, r9
  AND r4, r7, r1
  PUSH r11
  PUSH r2
  PUSH r10
  PUSH r15
  DIV r15, r2, r3
  DIV r15, r14, r4
  POP r15
  POP r10
  POP r2
  POP r11
  LDI r15, 0xDC2B0F
loop_0:
  ADDI r6, r12, 32
  LDI r7, 64
  FILL r7
  LDI r0, 1
  SUB r15, r15, r0
  JNZ r15, loop_0
  HALT
