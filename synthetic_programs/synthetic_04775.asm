; conditional logic
; initialization
  LDI r6, 255
  LDI r10, 0x1574ED
  CMP r8, r13
  JZ r8, else_0
  AND r4, r0, r15
  AND r3, r0, r1
  XOR r1, r12, r10
  AND r27, r6, r14
  JMP endif_1
else_0:
  LDI r3, 2
  LDI r5, 0x2CCFDB
  LDI r22, 3224
  LDI r15, 0xAF9EA7
  CIRCLE r3, r5, r22, r15
  LDI r15, 8
  FILL r15
  LDI r7, 3534
  FILL r7
endif_1:
  CMP r5, r1
  JZ r5, else_2
  SHR r4, r8, r12
  XOR r6, r10, r15
  XOR r13, r7, r3
  SHR r11, r4, r2
  JMP endif_3
else_2:
  LDI r15, 0x281469
  FILL r15
  LDI r1, 0xB1508A
  LDI r9, 2567
  LDI r9, 485
  LDI r8, 0x023FDF
  LDI r1, 2282
  RECTF r1, r9, r9, r8, r1
  LDI r5, 0x178A39
  LDI r12, 0xF953A6
  LDI r15, 64
  PSETI
endif_3:
  HALT
