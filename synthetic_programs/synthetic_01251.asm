; mixed program
; initialization
  LDI r5, 315
  LDI r14, 0x24E1A7
  LDI r8, 1
  CMP r7, r8
  JZ r7, else_0
  OR r1, r8, r4
  JMP endif_1
else_0:
  LDI r11, 0
  LDI r8, 0x8D40F9
  LDI r14, 2433
  PSETI
  LDI r7, 0xEEAFE3
  FILL r7
  LDI r3, 0x1F451D
  LDI r19, 1
  LDI r14, 0x6EBB14
  LDI r14, 439
  CIRCLE r3, r19, r14, r14
endif_1:
  OR r12, r2, r1
  OR r10, r3, r9
  LDI r9, 0xC4F911
  FILL r9
  SHLI r0, r14, 4
  SHR r8, r11, r7
  SAR r28, r14, r11
  IKEY r13
  CMPI r13, 256
  JNZ r13, key_2
  LDI r6, 8
  STORE r6, r15
  LOAD r8, r6
  LDI r8, 1139
  STORE r8, r14
  LOAD r5, r8
  LDI r9, 0
  STORE r9, r2
  LOAD r11, r9
  LDI r13, 91
  STORE r13, r11
  LOAD r8, r13
  HALT
