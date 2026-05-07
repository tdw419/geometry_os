; mixed program
; initialization
  LDI r15, 688
  LDI r4, 255
  LDI r11, 1193
  AND r2, r4, r0
  AND r12, r2, r1
  AND r11, r6, r10
  AND r14, r3, r7
  OR r14, r15, r12
  XOR r15, r10, r6
  AND r9, r2, r8
  XOR r1, r6, r12
  CMP r2, r6
  JNZ r2, else_0
  XOR r0, r30, r11
  JMP endif_1
else_0:
  LDI r0, 32
  LDI r4, 0xC517BC
  LDI r4, 0x006CB3
  PSET r0, r4, r4
endif_1:
  LDI r4, 10
  FILL r4
  IKEY r5
  CMPI r5, 255
  JNZ r5, key_2
  CMPI r7, 32
  LDI r8, 133
  STORE r8, r15
  LOAD r13, r8
  LDI r3, 8
  STORE r3, r1
  LOAD r0, r3
  LDI r4, 128
  STORE r4, r13
  LOAD r12, r4
  LDI r13, 128
  STORE r13, r9
  LOAD r11, r13
  LDI r11, 2778
  STORE r11, r5
  LOAD r0, r11
main_3:
  LDI r8, 0x09E569
  LDI r13, 2608
  LDI r0, 128
  LDI r3, 139
  CIRCLE r8, r13, r0, r3
  SAR r1, r9, r7
  SHL r10, r3, r9
  SHL r6, r14, r21
  FRAME
  JMP main_3
