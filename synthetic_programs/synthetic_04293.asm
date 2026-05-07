; conditional logic
; initialization
  LDI r5, 0x846A6B
  LDI r15, 3478
  CMP r12, r15
  JNZ r12, else_0
  XOR r8, r5, r15
  SUB r11, r6, r5
  DIV r12, r10, r14
  MOD r6, r12, r15
  JMP endif_1
else_0:
  LDI r14, 128
  LDI r5, 0xD05558
  LDI r3, 921
  LDI r1, 2
  LDI r5, 0x580A75
  RECTF r14, r5, r3, r1, r5
  LDI r6, 32
  FILL r6
  LDI r14, 16
  FILL r14
  LDI r7, 0x71CD79
  FILL r7
endif_1:
  HALT
