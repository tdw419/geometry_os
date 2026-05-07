; conditional logic
; initialization
  LDI r1, 60
  LDI r4, 0x9DD413
  LDI r2, 128
  LDI r12, 2
  LDI r14, 255
  CMP r2, r9
  JNZ r2, else_0
  OR r7, r0, r11
  SHL r2, r3, r10
  JMP endif_1
else_0:
  LDI r8, 2
  LDI r4, 16
  LDI r5, 0xDA37AB
  LDI r8, 2816
  LDI r2, 4
  LINE r8, r4, r5, r8, r2
  LDI r4, 0x9F3810
  LDI r4, 64
  LDI r2, 8
  LDI r13, 2
  LDI r5, 0x7B0423
  RECTF r4, r4, r2, r13, r5
  LDI r9, 2148
  LDI r1, 1565
  LDI r10, 8
  WPIXEL
  LDI r0, 64
  LDI r3, 16
  LDI r10, 64
  LDI r0, 0x34156F
  CIRCLE r0, r3, r10, r0
endif_1:
  CMP r5, r2
  JNZ r5, else_2
  SHL r0, r14, r13
  JMP endif_3
else_2:
  LDI r5, 762
  FILL r5
  LDI r3, 10
  LDI r0, 2375
  LDI r0, 1623
  LDI r1, 8
  LDI r10, 655
  RECTF r3, r0, r0, r1, r10
  LDI r21, 3520
  LDI r4, 1226
  LDI r0, 780
  WPIXEL
  LDI r8, 0x65A08F
  FILL r8
endif_3:
  CMP r0, r7
  JNZ r0, else_4
  XOR r15, r5, r7
  JMP endif_5
else_4:
  LDI r3, 0x9CC4FF
  LDI r0, 255
  LDI r1, 3806
  LDI r19, 0x773A33
  CIRCLE r3, r0, r1, r19
  LDI r6, 1344
  FILL r6
endif_5:
  HALT
