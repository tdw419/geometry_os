; conditional logic
; initialization
  LDI r2, 256
  LDI r12, 0x3DABEC
  LDI r25, 256
  LDI r8, 1378
  LDI r13, 2033
  LDI r20, 558
  LDI r7, 128
  CMP r14, r12
  JNZ r14, else_0
  XOR r4, r1, r5
  JMP endif_1
else_0:
  LDI r13, 0x5C27DC
  LDI r1, 16
  LDI r2, 0x7D6128
  PSETI
  LDI r0, 0x9C90F9
  LDI r5, 2793
  LDI r6, 349
  PSETI
endif_1:
  CMP r8, r7
  JZ r8, else_2
  OR r2, r13, r14
  DIV r22, r1, r9
  SUB r7, r12, r10
  OR r11, r6, r13
  JMP endif_3
else_2:
  LDI r14, 1859
  FILL r14
endif_3:
  CMP r11, r14
  JZ r11, else_4
  SHR r3, r5, r12
  OR r5, r4, r0
  XOR r9, r0, r4
  DIV r8, r14, r3
  JMP endif_5
else_4:
  LDI r0, 3160
  LDI r4, 3530
  LDI r27, 0x750DF7
  LDI r5, 0x167D08
  CIRCLE r0, r4, r27, r5
endif_5:
  HALT
