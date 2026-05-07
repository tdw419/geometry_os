; conditional logic
; initialization
  LDI r6, 2049
  LDI r7, 1080
  LDI r14, 10
  LDI r11, 3456
  CMP r0, r4
  JZ r0, else_0
  DIV r6, r1, r14
  SHL r1, r3, r12
  JMP endif_1
else_0:
  LDI r8, 0xAC6CD3
  LDI r0, 3077
  LDI r7, 0xAE60D3
  WPIXEL
endif_1:
  CMP r14, r7
  JNZ r14, else_2
  SUB r15, r7, r6
  JMP endif_3
else_2:
  LDI r14, 0x0D34AE
  LDI r10, 1
  LDI r13, 0x94044E
  PSETI
  LDI r8, 2204
  LDI r10, 1865
  LDI r31, 0x929A41
  PSETI
  LDI r5, 895
  LDI r7, 1635
  LDI r8, 0
  PSETI
  LDI r25, 2072
  LDI r9, 16
  LDI r15, 10
  PSET r25, r9, r15
endif_3:
  HALT
