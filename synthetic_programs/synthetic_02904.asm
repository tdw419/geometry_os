; conditional logic
; initialization
  LDI r12, 4
  LDI r3, 0x871C7F
  CMP r26, r9
  JNZ r26, else_0
  AND r10, r7, r11
  JMP endif_1
else_0:
  LDI r5, 8
  LDI r22, 1898
  LDI r14, 128
  LDI r10, 0xDEE9F2
  LDI r2, 0x700D76
  RECTF r5, r22, r14, r10, r2
endif_1:
  HALT
