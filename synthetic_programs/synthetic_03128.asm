; conditional logic
; initialization
  LDI r0, 64
  LDI r12, 8
  LDI r10, 1
  LDI r3, 10
  LDI r4, 3828
  LDI r1, 0x76CA8C
  CMP r12, r14
  JZ r12, else_0
  SHR r15, r11, r6
  XOR r13, r6, r14
  SUB r11, r2, r0
  OR r9, r4, r6
  JMP endif_1
else_0:
  LDI r10, 525
  LDI r7, 3448
  LDI r2, 255
  PSET r10, r7, r2
endif_1:
  CMP r1, r0
  JNZ r1, else_2
  XOR r8, r1, r5
  SUB r6, r1, r2
  JMP endif_3
else_2:
  LDI r15, 255
  LDI r7, 10
  LDI r13, 0xDAF764
  PSET r15, r7, r13
endif_3:
  HALT
