; conditional logic
; initialization
  LDI r12, 2
  LDI r8, 8
  LDI r4, 16
  LDI r11, 2771
  LDI r3, 2524
  CMP r12, r1
  JNZ r12, else_0
  OR r30, r14, r13
  SHR r5, r3, r13
  SHL r10, r2, r14
  JMP endif_1
else_0:
  LDI r18, 0x2B96B2
  LDI r8, 10
  LDI r5, 64
  LDI r1, 432
  LDI r5, 64
  LINE r18, r8, r5, r1, r5
  LDI r2, 2750
  LDI r7, 3108
  LDI r14, 0xA402A1
  LDI r0, 0x0F91E1
  LDI r7, 0xE49B35
  RECTF r2, r7, r14, r0, r7
endif_1:
  CMP r1, r0
  JNZ r1, else_2
  XOR r14, r10, r22
  MUL r10, r5, r14
  JMP endif_3
else_2:
  LDI r11, 1234
  LDI r12, 1057
  LDI r11, 0xD61847
  WPIXEL
  LDI r3, 0x81A152
  LDI r9, 1
  LDI r5, 2
  LDI r12, 16
  LDI r14, 10
  RECTF r3, r9, r5, r12, r14
  LDI r7, 2217
  LDI r2, 2551
  LDI r15, 2
  PSETI
endif_3:
  CMP r3, r15
  JNZ r3, else_4
  XOR r2, r15, r6
  MUL r4, r11, r13
  MOD r26, r1, r13
  JMP endif_5
else_4:
  LDI r4, 606
  LDI r0, 256
  LDI r2, 8
  LDI r14, 0x9D782A
  LDI r4, 91
  RECTF r4, r0, r2, r14, r4
  LDI r14, 128
  LDI r12, 255
  LDI r2, 0x6F00BD
  LDI r1, 1202
  CIRCLE r14, r12, r2, r1
endif_5:
  HALT
