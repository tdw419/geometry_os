; conditional logic
; initialization
  LDI r19, 0x5AF762
  LDI r7, 0
  LDI r4, 481
  LDI r9, 32
  LDI r13, 3682
  LDI r14, 0
  LDI r2, 255
  LDI r3, 0x91ED0F
  CMP r15, r14
  JNZ r15, else_0
  OR r10, r15, r0
  JMP endif_1
else_0:
  LDI r4, 64
  LDI r6, 3317
  LDI r0, 32
  LDI r6, 3760
  LDI r4, 255
  RECTF r4, r6, r0, r6, r4
endif_1:
  CMP r11, r4
  JNZ r11, else_2
  AND r10, r11, r12
  AND r3, r2, r11
  JMP endif_3
else_2:
  LDI r14, 64
  LDI r1, 2
  LDI r13, 128
  PSETI
  LDI r11, 177
  LDI r12, 383
  LDI r8, 0
  PSETI
  LDI r1, 438
  LDI r11, 0x3EA3E7
  LDI r2, 1182
  LDI r14, 3312
  CIRCLE r1, r11, r2, r14
  LDI r0, 0x3C8E05
  LDI r7, 0
  LDI r0, 3522
  LDI r12, 2598
  LDI r8, 16
  RECTF r0, r7, r0, r12, r8
endif_3:
  CMP r13, r9
  JZ r13, else_4
  SHR r9, r0, r1
  SHL r11, r5, r20
  JMP endif_5
else_4:
  LDI r15, 10
  LDI r7, 16
  LDI r3, 256
  LDI r8, 3047
  CIRCLE r15, r7, r3, r8
endif_5:
  HALT
