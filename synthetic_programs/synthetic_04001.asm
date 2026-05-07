; conditional logic
; initialization
  LDI r4, 0x445A91
  LDI r15, 8
  LDI r7, 128
  LDI r12, 0x6B51D0
  CMP r12, r3
  JZ r12, else_0
  AND r6, r9, r4
  DIV r1, r12, r11
  SHL r9, r0, r16
  JMP endif_1
else_0:
  LDI r11, 0x0A8979
  FILL r11
  LDI r13, 3569
  LDI r1, 0xB00CE5
  LDI r15, 2338
  LDI r8, 16
  LDI r1, 2
  LINE r13, r1, r15, r8, r1
  LDI r5, 744
  LDI r9, 10
  LDI r10, 0x2650B6
  LDI r14, 255
  LDI r8, 984
  RECTF r5, r9, r10, r14, r8
endif_1:
  CMP r13, r23
  JNZ r13, else_2
  SUB r1, r13, r8
  JMP endif_3
else_2:
  LDI r9, 0x335604
  FILL r9
  LDI r7, 0x17F377
  LDI r15, 16
  LDI r12, 255
  LDI r1, 1374
  LDI r1, 2169
  LINE r7, r15, r12, r1, r1
  LDI r21, 128
  LDI r31, 0xDDF731
  LDI r5, 0xBAAA19
  WPIXEL
  LDI r3, 128
  FILL r3
endif_3:
  CMP r14, r10
  JNZ r14, else_4
  SHR r5, r12, r10
  DIV r25, r7, r14
  MUL r15, r0, r5
  JMP endif_5
else_4:
  LDI r22, 0xBCEAAB
  FILL r22
  LDI r7, 2072
  LDI r13, 991
  LDI r13, 2102
  LDI r13, 256
  LDI r2, 16
  RECTF r7, r13, r13, r13, r2
endif_5:
  HALT
