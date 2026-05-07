; mixed program
; initialization
  LDI r11, 2756
  LDI r12, 256
  LDI r4, 0x4447D9
  LDI r3, 256
  LDI r0, 0xDC4341
  LDI r10, 8
  LDI r15, 2711
  CMP r7, r0
  JZ r7, else_0
  OR r0, r13, r11
  SHL r12, r14, r11
  JMP endif_1
else_0:
  LDI r10, 4
  LDI r1, 64
  LDI r3, 2319
  LDI r10, 32
  LDI r8, 4
  RECTF r10, r1, r3, r10, r8
  LDI r18, 2923
  FILL r18
endif_1:
  CMP r11, r6
  MOD r12, r0, r9
  SHL r12, r14, r15
  SHR r13, r9, r6
  SHL r7, r9, r2
  SAR r0, r15, r14
  LDI r12, 1487
  LDI r9, 0xAA4737
  LDI r15, 0x3F4892
  LDI r0, 307
  LDI r0, 0x1A1446
  RECTF r12, r9, r15, r0, r0
  CMPI r15, 43
  SUB r3, r12, r5
  SAR r18, r8, r9
  SHR r2, r10, r11
  HALT
