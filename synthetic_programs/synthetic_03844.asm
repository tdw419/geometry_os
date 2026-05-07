; conditional logic
; initialization
  LDI r5, 0x209B75
  LDI r2, 659
  CMP r12, r2
  JZ r12, else_0
  AND r3, r11, r13
  MUL r4, r0, r8
  SUB r6, r0, r13
  JMP endif_1
else_0:
  LDI r6, 0x19FF8D
  FILL r6
  LDI r1, 0x210FF4
  LDI r1, 3788
  LDI r7, 0x3CE55B
  PSETI
endif_1:
  CMP r23, r5
  JNZ r23, else_2
  XOR r0, r12, r5
  SHL r14, r4, r6
  MOD r19, r3, r7
  JMP endif_3
else_2:
  LDI r5, 2412
  LDI r11, 0x4F4B8E
  LDI r10, 0x153158
  LDI r0, 10
  LDI r6, 0xE23004
  RECTF r5, r11, r10, r0, r6
  LDI r10, 3988
  LDI r15, 32
  LDI r5, 2
  LDI r12, 0xCAF55D
  CIRCLE r10, r15, r5, r12
  LDI r9, 256
  LDI r4, 128
  LDI r12, 255
  LDI r10, 2502
  LDI r10, 1950
  LINE r9, r4, r12, r10, r10
  LDI r0, 0xC2FBDD
  FILL r0
endif_3:
  CMP r9, r10
  JZ r9, else_4
  OR r15, r18, r7
  SHL r14, r4, r12
  MUL r0, r10, r3
  JMP endif_5
else_4:
  LDI r8, 1082
  LDI r14, 0x1FD022
  LDI r10, 0x8A9590
  PSETI
  LDI r14, 2607
  FILL r14
endif_5:
  HALT
