; conditional logic
; initialization
  LDI r11, 0x682E62
  LDI r14, 8
  LDI r10, 2117
  LDI r22, 0x1D052E
  LDI r13, 1601
  LDI r0, 3196
  LDI r3, 1
  LDI r30, 1
  CMP r6, r4
  JNZ r6, else_0
  OR r15, r2, r5
  MUL r13, r9, r7
  OR r14, r30, r15
  JMP endif_1
else_0:
  LDI r2, 0x91E489
  LDI r15, 202
  LDI r15, 0
  LDI r3, 856
  LDI r2, 0xA3229C
  RECTF r2, r15, r15, r3, r2
  LDI r9, 658
  LDI r3, 2704
  LDI r15, 1958
  LDI r13, 2576
  LDI r9, 0x653883
  LINE r9, r3, r15, r13, r9
  LDI r4, 0x5301CF
  FILL r4
endif_1:
  CMP r15, r2
  JZ r15, else_2
  SHR r12, r11, r6
  OR r4, r13, r15
  SHL r11, r1, r8
  JMP endif_3
else_2:
  LDI r11, 446
  LDI r14, 3642
  LDI r3, 2513
  PSETI
  LDI r12, 1082
  LDI r7, 1258
  LDI r0, 0
  LDI r10, 0x759B7E
  LDI r14, 4
  RECTF r12, r7, r0, r10, r14
  LDI r2, 10
  LDI r9, 137
  LDI r12, 32
  LDI r6, 0x26C1DC
  LDI r4, 2
  LINE r2, r9, r12, r6, r4
  LDI r14, 1
  FILL r14
endif_3:
  CMP r4, r5
  JZ r4, else_4
  ADD r31, r2, r10
  AND r13, r12, r14
  JMP endif_5
else_4:
  LDI r4, 358
  LDI r10, 3601
  LDI r3, 998
  LDI r29, 0xCF8AA9
  LDI r11, 1022
  RECTF r4, r10, r3, r29, r11
endif_5:
  HALT
