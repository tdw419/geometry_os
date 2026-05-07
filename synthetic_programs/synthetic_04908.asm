; conditional logic
; initialization
  LDI r3, 32
  LDI r4, 0x0C1CF4
  CMP r13, r2
  JNZ r13, else_0
  DIV r5, r4, r12
  JMP endif_1
else_0:
  LDI r1, 10
  LDI r7, 969
  LDI r10, 3831
  PSET r1, r7, r10
  LDI r3, 255
  LDI r14, 1
  LDI r0, 1700
  WPIXEL
endif_1:
  CMP r8, r0
  JNZ r8, else_2
  SHL r8, r12, r25
  SHR r15, r6, r4
  SUB r6, r11, r29
  JMP endif_3
else_2:
  LDI r11, 32
  LDI r5, 20
  LDI r9, 3771
  PSETI
endif_3:
  HALT
