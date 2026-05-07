; mixed program
; initialization
  LDI r28, 1
  LDI r14, 3102
  LDI r6, 3717
  FILL r6
  PUSH r4
  PUSH r13
  MOD r1, r11, r8
  AND r8, r7, r0
  AND r6, r10, r3
  ADD r19, r10, r8
  XOR r24, r3, r5
  POP r13
  POP r4
  CMP r11, r10
  JZ r11, else_0
  MUL r8, r11, r0
  MUL r5, r4, r25
  AND r5, r6, r1
  OR r13, r14, r5
  JMP endif_1
else_0:
  LDI r6, 3669
  LDI r10, 1125
  LDI r12, 1228
  PSET r6, r10, r12
  LDI r10, 699
  LDI r7, 453
  LDI r0, 1
  LDI r7, 1350
  CIRCLE r10, r7, r0, r7
  LDI r2, 256
  LDI r0, 761
  LDI r1, 3220
  LDI r6, 16
  LDI r10, 2782
  LINE r2, r0, r1, r6, r10
  LDI r8, 64
  FILL r8
endif_1:
  IKEY r9
  CMPI r9, 16
  JNZ r9, key_2
  SHR r3, r0, r4
  SHR r15, r8, r1
  LDI r11, 0x4E11DB
  STORE r11, r0
  LOAD r21, r11
  LDI r15, 1
  STORE r15, r20
  LOAD r31, r15
  LDI r5, 8
  STORE r5, r1
  LOAD r9, r5
  LDI r7, 0
  STORE r7, r15
  LOAD r14, r7
  SHL r3, r7, r14
  HALT
