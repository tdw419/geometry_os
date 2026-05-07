; conditional logic
; initialization
  LDI r13, 0xBBB037
  LDI r6, 0x26F502
  LDI r10, 2
  LDI r14, 255
  LDI r3, 256
  LDI r2, 0x619993
  CMP r19, r0
  JZ r19, else_0
  DIV r10, r13, r6
  SHR r7, r13, r9
  JMP endif_1
else_0:
  LDI r1, 4048
  FILL r1
  LDI r15, 0xC9E9BF
  LDI r29, 128
  LDI r1, 0x41EBDF
  LDI r11, 1633
  LDI r5, 1910
  RECTF r15, r29, r1, r11, r5
  LDI r4, 1
  LDI r6, 0xC31264
  LDI r9, 4
  WPIXEL
  LDI r4, 10
  FILL r4
endif_1:
  HALT
