; conditional logic
; initialization
  LDI r12, 1
  LDI r15, 0
  LDI r5, 0x6E980A
  LDI r7, 32
  LDI r8, 0x41DA17
  CMP r9, r15
  JNZ r9, else_0
  MUL r9, r1, r4
  XOR r9, r0, r11
  AND r9, r14, r3
  JMP endif_1
else_0:
  LDI r0, 1707
  LDI r11, 0x7549F8
  LDI r4, 3699
  PSETI
  LDI r14, 3499
  LDI r6, 3343
  LDI r13, 1
  PSETI
  LDI r10, 3353
  FILL r10
endif_1:
  CMP r11, r8
  JZ r11, else_2
  SHR r8, r14, r1
  XOR r1, r10, r9
  JMP endif_3
else_2:
  LDI r0, 3727
  LDI r10, 4
  LDI r5, 2410
  PSETI
endif_3:
  HALT
