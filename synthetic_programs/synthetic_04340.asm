; conditional logic
; initialization
  LDI r8, 0xB81549
  LDI r7, 0xCB4381
  LDI r4, 0x2C08C4
  LDI r15, 4
  LDI r10, 10
  CMP r0, r13
  JNZ r0, else_0
  XOR r1, r3, r2
  OR r9, r12, r6
  DIV r13, r4, r7
  SHR r2, r5, r9
  JMP endif_1
else_0:
  LDI r7, 0x40AA9B
  LDI r13, 0x0EB9E3
  LDI r8, 10
  LDI r3, 758
  LDI r1, 0xB0CCB0
  LINE r7, r13, r8, r3, r1
  LDI r15, 825
  LDI r11, 4
  LDI r8, 255
  LDI r4, 0x196D94
  LDI r18, 0xDB92C7
  LINE r15, r11, r8, r4, r18
  LDI r9, 249
  LDI r0, 0x6AE954
  LDI r14, 0
  PSETI
endif_1:
  HALT
