; conditional logic
; initialization
  LDI r11, 128
  LDI r1, 3803
  LDI r13, 0xEDB16E
  LDI r5, 32
  LDI r2, 3093
  CMP r6, r7
  JNZ r6, else_0
  MUL r7, r10, r9
  SHL r14, r2, r1
  JMP endif_1
else_0:
  LDI r2, 0x924B72
  LDI r9, 16
  LDI r0, 0x93A7A2
  WPIXEL
  LDI r10, 0xADD4A4
  LDI r12, 1391
  LDI r9, 2
  LDI r14, 3062
  LDI r7, 2837
  LINE r10, r12, r9, r14, r7
endif_1:
  HALT
