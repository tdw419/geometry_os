; conditional logic
; initialization
  LDI r2, 1
  LDI r8, 1
  LDI r3, 574
  LDI r0, 3524
  LDI r10, 0x51BA92
  LDI r15, 1037
  LDI r6, 10
  CMP r14, r16
  JNZ r14, else_0
  SUB r3, r14, r5
  JMP endif_1
else_0:
  LDI r4, 1
  LDI r5, 2
  LDI r3, 10
  LDI r12, 1
  LDI r5, 0x19DD3F
  RECTF r4, r5, r3, r12, r5
  LDI r7, 8
  LDI r10, 8
  LDI r10, 128
  PSETI
endif_1:
  HALT
