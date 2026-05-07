; conditional logic
; initialization
  LDI r5, 10
  LDI r2, 8
  LDI r0, 508
  CMP r14, r10
  JNZ r14, else_0
  OR r10, r0, r1
  SHR r29, r0, r11
  JMP endif_1
else_0:
  LDI r6, 255
  LDI r0, 0xED68A4
  LDI r8, 0xE5E49A
  PSETI
  LDI r9, 130
  LDI r13, 8
  LDI r4, 10
  PSETI
  LDI r4, 255
  LDI r9, 2122
  LDI r15, 0x455932
  PSETI
  LDI r26, 0x29860F
  LDI r6, 1459
  LDI r5, 1189
  PSETI
endif_1:
  CMP r1, r7
  JNZ r1, else_2
  OR r5, r20, r4
  MUL r2, r14, r13
  SHR r14, r11, r8
  SHL r15, r0, r8
  JMP endif_3
else_2:
  LDI r13, 2515
  LDI r1, 0x281DB6
  LDI r9, 0xF72FED
  LDI r6, 256
  LDI r9, 0x336EA8
  RECTF r13, r1, r9, r6, r9
  LDI r12, 3424
  LDI r16, 2041
  LDI r17, 2786
  LDI r4, 280
  LDI r8, 128
  LINE r12, r16, r17, r4, r8
  LDI r8, 4
  LDI r12, 64
  LDI r5, 3598
  PSET r8, r12, r5
endif_3:
  CMP r2, r0
  JZ r2, else_4
  AND r13, r4, r2
  SHR r13, r8, r6
  SHR r13, r11, r8
  MOD r0, r8, r4
  JMP endif_5
else_4:
  LDI r2, 3959
  LDI r10, 0xE2CCB5
  LDI r2, 255
  PSETI
  LDI r14, 0x19F03F
  LDI r6, 0x4B99B7
  LDI r8, 2932
  PSETI
  LDI r13, 2
  FILL r13
  LDI r12, 0xB19BEC
  LDI r4, 64
  LDI r12, 4
  WPIXEL
endif_5:
  HALT
