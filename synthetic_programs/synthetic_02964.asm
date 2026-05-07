; conditional logic
; initialization
  LDI r13, 256
  LDI r15, 0x2D50DD
  CMP r30, r10
  JNZ r30, else_0
  MOD r15, r7, r11
  JMP endif_1
else_0:
  LDI r0, 3455
  LDI r14, 0x69F07B
  LDI r6, 128
  PSET r0, r14, r6
  LDI r2, 0x508A38
  FILL r2
  LDI r8, 2518
  FILL r8
endif_1:
  HALT
