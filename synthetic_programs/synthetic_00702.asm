; conditional logic
; initialization
  LDI r1, 0x2CA000
  LDI r5, 573
  LDI r4, 37
  LDI r22, 0x9DC3E7
  CMP r6, r3
  JNZ r6, else_0
  XOR r14, r15, r13
  JMP endif_1
else_0:
  LDI r8, 1
  FILL r8
  LDI r1, 32
  LDI r1, 16
  LDI r6, 10
  LDI r5, 3238
  LDI r6, 1690
  RECTF r1, r1, r6, r5, r6
  LDI r15, 32
  LDI r11, 255
  LDI r2, 3557
  LDI r11, 1936
  LDI r4, 0x337E46
  LINE r15, r11, r2, r11, r4
  LDI r0, 0xC74599
  LDI r3, 3403
  LDI r5, 0xD9B7E6
  PSET r0, r3, r5
endif_1:
  CMP r14, r10
  JZ r14, else_2
  SHR r8, r28, r11
  SHL r13, r14, r12
  MOD r25, r0, r13
  JMP endif_3
else_2:
  LDI r13, 0xA5D405
  FILL r13
  LDI r5, 8
  FILL r5
  LDI r9, 2615
  LDI r5, 1
  LDI r2, 3555
  WPIXEL
  LDI r4, 0xB6E52D
  LDI r7, 10
  LDI r7, 2330
  LDI r1, 3886
  CIRCLE r4, r7, r7, r1
endif_3:
  CMP r14, r2
  JNZ r14, else_4
  DIV r10, r6, r12
  MOD r0, r13, r14
  XOR r6, r10, r8
  JMP endif_5
else_4:
  LDI r9, 0x153B2E
  LDI r2, 10
  LDI r6, 1084
  LDI r3, 1491
  LDI r13, 3183
  RECTF r9, r2, r6, r3, r13
  LDI r2, 64
  LDI r1, 0xC5C5FC
  LDI r4, 0xDA46C9
  LDI r6, 0x0EBB58
  LDI r12, 0xF2B7AF
  LINE r2, r1, r4, r6, r12
endif_5:
  HALT
