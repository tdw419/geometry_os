; conditional logic
; initialization
  LDI r22, 2280
  LDI r10, 0xAD3138
  LDI r2, 3311
  LDI r8, 95
  CMP r13, r3
  JNZ r13, else_0
  SUB r15, r2, r8
  JMP endif_1
else_0:
  LDI r13, 10
  LDI r9, 64
  LDI r6, 3427
  WPIXEL
  LDI r6, 2427
  LDI r6, 0xB1B10B
  LDI r1, 0x5D8A67
  LDI r8, 4
  CIRCLE r6, r6, r1, r8
endif_1:
  HALT
