; conditional logic
; initialization
  LDI r14, 128
  LDI r0, 1261
  LDI r5, 0x1CF515
  LDI r2, 0xAE0EB6
  LDI r12, 0xDD1306
  LDI r9, 128
  LDI r1, 1522
  CMP r8, r0
  JNZ r8, else_0
  OR r10, r2, r17
  SHR r11, r3, r5
  JMP endif_1
else_0:
  LDI r12, 0x50BC2B
  LDI r9, 64
  LDI r14, 2696
  LDI r13, 0xA1E6FF
  CIRCLE r12, r9, r14, r13
  LDI r6, 8
  LDI r14, 0x2344D9
  LDI r12, 0x4785C6
  LDI r1, 0xF3926F
  LDI r2, 1875
  RECTF r6, r14, r12, r1, r2
  LDI r9, 0x771D70
  LDI r10, 4
  LDI r2, 16
  LDI r14, 1543
  CIRCLE r9, r10, r2, r14
endif_1:
  CMP r6, r13
  JZ r6, else_2
  ADD r2, r5, r13
  JMP endif_3
else_2:
  LDI r14, 1
  FILL r14
  LDI r15, 0
  LDI r3, 508
  LDI r3, 1499
  PSETI
  LDI r15, 128
  LDI r11, 4
  LDI r4, 2
  LDI r5, 255
  CIRCLE r15, r11, r4, r5
  LDI r27, 0x1B6E9B
  LDI r15, 326
  LDI r14, 2934
  LDI r3, 255
  CIRCLE r27, r15, r14, r3
endif_3:
  HALT
