; mixed program
; initialization
  LDI r7, 256
  LDI r14, 1550
  LDI r11, 388
  LDI r8, 898
  LDI r1, 1722
  LDI r5, 3062
  LDI r15, 0x5971D8
  LDI r4, 0x2E3198
  PUSH r12
  SHL r6, r12, r2
  AND r13, r2, r14
  MUL r12, r11, r1
  MUL r0, r7, r3
  POP r12
  LDI r10, 8
  STORE r10, r13
  LOAD r9, r10
  LDI r13, 1312
  STORE r13, r15
  LOAD r2, r13
  LDI r11, 0x7FD45D
  STORE r11, r8
  LOAD r2, r11
  LDI r8, 2677
  STORE r8, r7
  LOAD r1, r8
  LDI r30, 2356
  STORE r30, r15
  LOAD r13, r30
  LDI r14, 2
  FILL r14
  LDI r9, 16
loop_0:
  CMPI r11, r4, 0x92F555
  CMPI r10, r6, 0xF2FD98
  LDI r6, 2108
  LDI r9, 0x0901B5
  LDI r5, 476
  LDI r4, 0xEA101F
  LDI r14, 0x5F243B
  RECTF r6, r9, r5, r4, r14
  SUB r13, r0, r11
  LDI r24, 1
  SUB r9, r9, r24
  JNZ r9, loop_0
  CALL func_1
func_1:
  SUB r13, r1, r10
  SHL r30, r23, r8
  SUB r11, r1, r0
  XOR r12, r2, r15
  RET
  HALT
