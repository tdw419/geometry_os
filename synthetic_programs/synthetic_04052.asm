; conditional logic
; initialization
  LDI r14, 256
  LDI r0, 128
  LDI r2, 2169
  LDI r12, 32
  LDI r10, 0xF624F5
  LDI r7, 0x3AE69B
  CMP r8, r10
  JZ r8, else_0
  OR r7, r4, r5
  AND r11, r9, r7
  SHL r29, r10, r15
  SHL r0, r25, r8
  JMP endif_1
else_0:
  LDI r6, 128
  LDI r5, 1623
  LDI r0, 0x371451
  LDI r11, 256
  CIRCLE r6, r5, r0, r11
  LDI r6, 565
  LDI r13, 64
  LDI r7, 148
  LDI r14, 0x134630
  LDI r3, 1
  LINE r6, r13, r7, r14, r3
endif_1:
  HALT
