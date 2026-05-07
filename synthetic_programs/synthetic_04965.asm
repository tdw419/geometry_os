; mixed program
; initialization
  LDI r2, 1233
  LDI r3, 0xA87A51
  LDI r26, 4
  LDI r14, 3298
  PUSH r6
  PUSH r12
  PUSH r6
  XOR r15, r0, r2
  OR r4, r5, r9
  ADD r3, r15, r5
  POP r6
  POP r12
  POP r6
  LDI r12, 2
  LDI r19, 2454
  LDI r26, 0x9DD547
  TEXT r12, r19, r26, "HELLO"
  LDI r14, 1794
  STORE r14, r20
  LOAD r11, r14
  LDI r0, 128
  STORE r0, r15
  LOAD r4, r0
  LDI r7, 4
  STORE r7, r13
  LOAD r10, r7
  LDI r2, 3764
  STORE r2, r15
  LOAD r1, r2
  CALL func_0
func_0:
  MOD r4, r0, r15
  MUL r0, r13, r15
  ADD r5, r10, r7
  SUB r1, r15, r8
  DIV r12, r8, r6
  SHL r14, r9, r15
  RET
  LDI r15, 0
  LDI r8, 8
  LDI r2, 4
  LDI r7, 0
  LDI r8, 1
  RECTF r15, r8, r2, r7, r8
  SAR r6, r4, r14
  SAR r0, r8, r13
  CMP r8, r5
  JNZ r8, else_1
  XOR r7, r1, r4
  AND r10, r5, r14
  XOR r9, r3, r4
  SHL r3, r7, r14
  JMP endif_2
else_1:
  LDI r8, 340
  LDI r22, 562
  LDI r0, 847
  PSET r8, r22, r0
  LDI r0, 2394
  LDI r3, 147
  LDI r14, 2315
  PSET r0, r3, r14
endif_2:
main_3:
  AND r2, r14, r10
  XOR r8, r5, r10
  CMPI r15, r1, 255
  SHLI r28, r0, 255
  SAR r5, r15, r7
  SAR r1, r13, r15
  SAR r8, r11, r3
  SHLI r4, r12, 0xCF08B0
  SAR r13, r3, r8
  FRAME
  JMP main_3
