; conditional logic
; initialization
  LDI r2, 0x0FF67F
  LDI r15, 0x265365
  LDI r8, 255
  LDI r14, 1527
  LDI r13, 0x26D5B3
  LDI r0, 256
  LDI r20, 1970
  LDI r6, 255
  CMP r3, r13
  JZ r3, else_0
  XOR r7, r31, r8
  JMP endif_1
else_0:
  LDI r5, 0x1D2925
  FILL r5
  LDI r2, 0
  LDI r3, 256
  LDI r14, 748
  PSETI
  LDI r14, 16
  LDI r3, 0x9E52C9
  LDI r15, 1160
  LDI r23, 8
  LDI r7, 1122
  RECTF r14, r3, r15, r23, r7
  LDI r0, 2480
  FILL r0
endif_1:
  HALT
