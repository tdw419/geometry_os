; conditional logic
; initialization
  LDI r13, 0x3EC09B
  LDI r0, 16
  LDI r7, 3232
  LDI r6, 2
  LDI r14, 1960
  LDI r12, 2137
  LDI r5, 3860
  LDI r15, 10
  CMP r5, r1
  JNZ r5, else_0
  OR r30, r3, r9
  SHR r10, r14, r2
  MUL r13, r3, r1
  JMP endif_1
else_0:
  LDI r13, 255
  LDI r31, 3297
  LDI r10, 0x09ACC7
  LDI r4, 16
  LDI r1, 128
  LINE r13, r31, r10, r4, r1
  LDI r14, 2944
  LDI r4, 0xA99EA8
  LDI r1, 2129
  WPIXEL
endif_1:
  CMP r13, r14
  JZ r13, else_2
  MOD r6, r5, r0
  AND r15, r4, r10
  JMP endif_3
else_2:
  LDI r9, 255
  FILL r9
  LDI r25, 128
  LDI r2, 3744
  LDI r3, 2274
  WPIXEL
  LDI r10, 256
  FILL r10
  LDI r5, 0xEF2816
  LDI r11, 64
  LDI r3, 0
  LDI r8, 0xCD2174
  CIRCLE r5, r11, r3, r8
endif_3:
  HALT
