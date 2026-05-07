; mixed program
; initialization
  LDI r11, 0xAC5D5D
  LDI r3, 2876
  LDI r0, 0x04EA27
  LDI r16, 0x403117
  LDI r4, 2182
  LDI r8, 2537
  PUSH r2
  PUSH r7
  PUSH r3
  PUSH r11
  OR r20, r13, r23
  ADD r14, r2, r1
  AND r7, r10, r13
  POP r11
  POP r3
  POP r7
  POP r2
  AND r12, r26, r15
  XOR r12, r14, r1
  LDI r6, 256
  STORE r6, r10
  LOAD r4, r6
  LDI r5, 32
  STORE r5, r6
  LOAD r13, r5
  LDI r14, 0x3E6AD5
  STORE r14, r6
  LOAD r3, r14
  LDI r12, 1474
  STORE r12, r13
  LOAD r1, r12
  LDI r13, 255
  STORE r13, r2
  LOAD r31, r13
  HALT
