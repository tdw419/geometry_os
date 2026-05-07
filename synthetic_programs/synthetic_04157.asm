; mixed program
; initialization
  LDI r20, 2506
  LDI r3, 1222
  LDI r12, 3932
  LDI r1, 3842
  LDI r0, 1778
  LDI r2, 32
  LDI r8, 255
  STORE r8, r5
  LOAD r14, r8
  LDI r5, 2
  STORE r5, r1
  LOAD r15, r5
  LDI r6, 2923
  STORE r6, r10
  LOAD r14, r6
  LDI r0x704B0x704B, 3058
  STORE r11, r14
  LOAD r1, r11
  LDI r1, 2
  STORE r1, r9
  LOAD r2, r1
  LDI r9, 0xADB4A1
  STORE r9, r13
  LOAD r25, r9
  LDI r4, 2102
  STORE r4, r2
  LOAD r12, r4
  LDI r6, 43
loop_0:
  SUBI r7, r10, 0x3957D0
  DIV r0, r3, r10
  OR r14, r10, r1
  LDI r27, 0xA0A752
  FILL r27
  LDI r31, 1
  SUB r6, r6, r31
  JNZ r6, loop_0
  LDI r13, 2731
  STORE r13, r14
  LOAD r3, r13
  LDI r23, 3586
  STORE r23, r10
  LOAD r8, r23
  LDI r23, 1955
  STORE r23, r8
  LOAD r9, r23
  IKEY r9
  CMPI r9, 255
  JNZ r9, key_1
  AND r4, r12, r0
  AND r3, r5, r12
  IKEY r5
  CMPI r5, 0x872F22
  JNZ r5, key_2
  HALT
