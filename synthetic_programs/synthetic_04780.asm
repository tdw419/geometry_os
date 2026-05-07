; mixed program
; initialization
  LDI r4, 3564
  LDI r9, 0x8FEC83
  LDI r12, 341
  LDI r7, 3931
  LDI r13, 128
  LDI r1, 2141
  LDI r0, 2640
  LDI r4, 13
loop_0:
  LDI r1, 0xE1255E
  LDI r7, 2257
  LDI r11, 256
  WPIXEL
  LDI r14, 1
  SUB r4, r4, r14
  JNZ r4, loop_0
  LDI r5, 3511
  STORE r5, r3
  LOAD r11, r5
  LDI r6, 10
  STORE r6, r9
  LOAD r5, r6
  LDI r13, 0x2A7C51
  STORE r13, r21
  LOAD r12, r13
  LDI r7, 128
  STORE r7, r9
  LOAD r0, r7
  LDI r8, 112
  STORE r8, r11
  LOAD r5, r8
  LDI r1, 256
  STORE r1, r1
  LOAD r0, r1
  LDI r3, 521
  LDI r8, 128
  LDI r4, 8
  LDI r13, 2992
  CIRCLE r3, r8, r4, r13
  PUSH r15
  PUSH r9
  PUSH r4
  PUSH r6
  MOD r12, r6, r14
  OR r5, r7, r2
  ADD r6, r15, r12
  POP r6
  POP r4
  POP r9
  POP r15
  PUSH r11
  OR r3, r13, r4
  MOD r9, r8, r11
  DIV r8, r15, r3
  POP r11
  HALT
