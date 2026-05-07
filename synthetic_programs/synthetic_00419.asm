; conditional logic
; initialization
  LDI r6, 32
  LDI r7, 0x559DF3
  LDI r2, 8
  LDI r10, 2
  LDI r8, 0xD6EA5E
  CMP r6, r5
  JZ r6, else_0
  SUB r14, r4, r15
  SHR r30, r7, r6
  JMP endif_1
else_0:
  LDI r12, 32
  FILL r12
endif_1:
  HALT
