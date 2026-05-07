; mixed program
; initialization
  LDI r11, 128
  LDI r12, 4
  LDI r7, 4
  LDI r4, 1431
  LDI r9, 0x72B394
  IKEY r9
  CMPI r9, 0x407B83
  JNZ r9, key_0
  CALL func_1
func_1:
  MOD r2, r15, r1
  XOR r13, r0, r8
  RET
  CMP r11, r3
  JNZ r11, else_2
  AND r11, r5, r4
  OR r6, r2, r13
  JMP endif_3
else_2:
  LDI r15, 64
  LDI r14, 32
  LDI r12, 3835
  LDI r12, 42
  LDI r2, 1149
  RECTF r15, r14, r12, r12, r2
  LDI r2, 16
  LDI r12, 4
  LDI r5, 1509
  LDI r30, 1061
  LDI r7, 676
  RECTF r2, r12, r5, r30, r7
  LDI r18, 3841
  LDI r27, 32
  LDI r13, 128
  PSETI
  LDI r3, 0xC50AA7
  LDI r15, 1133
  LDI r14, 32
  PSET r3, r15, r14
endif_3:
  LDI r10, 0xD99F36
  LDI r4, 1239
  LDI r12, 0xB8E909
  WPIXEL
  IKEY r2
  CMPI r2, 151
  JNZ r2, key_4
  LDI r12, 4
loop_5:
  MUL r19, r11, r8
  LDI r5, 3456
  LDI r10, 4
  LDI r8, 0xD94741
  LDI r7, 0xC0C985
  LDI r13, 32
  RECTF r5, r10, r8, r7, r13
  LDI r7, 128
  LDI r14, 128
  LDI r29, 3826
  WPIXEL
  LDI r10, 1
  SUB r12, r12, r10
  JNZ r12, loop_5
  OR r12, r8, r9
  XOR r6, r14, r2
  OR r12, r3, r15
  OR r1, r4, r14
  HALT
