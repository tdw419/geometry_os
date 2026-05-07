; conditional logic
; initialization
  LDI r7, 3425
  LDI r10, 2421
  LDI r15, 2450
  CMP r14, r6
  JNZ r14, else_0
  AND r1, r2, r12
  JMP endif_1
else_0:
  LDI r15, 0x1D3CC9
  LDI r5, 255
  LDI r2, 128
  LDI r2, 1
  CIRCLE r15, r5, r2, r2
endif_1:
  HALT
