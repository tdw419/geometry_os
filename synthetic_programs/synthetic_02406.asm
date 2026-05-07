; conditional logic
; initialization
  LDI r12, 36
  LDI r23, 128
  CMP r5, r4
  JNZ r5, else_0
  DIV r12, r10, r8
  SHR r6, r2, r0
  JMP endif_1
else_0:
  LDI r2, 2353
  LDI r8, 1438
  LDI r7, 0xC0289F
  PSET r2, r8, r7
  LDI r2, 255
  LDI r8, 0xD3D06C
  LDI r4, 2
  PSETI
  LDI r12, 1915
  LDI r6, 0xCE5B01
  LDI r10, 1881
  PSET r12, r6, r10
endif_1:
  HALT
