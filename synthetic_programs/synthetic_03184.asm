; conditional logic
; initialization
  LDI r12, 675
  LDI r1, 3854
  LDI r9, 10
  LDI r8, 1
  LDI r10, 650
  LDI r7, 3664
  LDI r5, 0x0191B7
  LDI r4, 1
  CMP r3, r8
  JNZ r3, else_0
  XOR r13, r10, r5
  XOR r9, r2, r8
  MOD r5, r12, r31
  AND r15, r10, r24
  JMP endif_1
else_0:
  LDI r6, 0x910809
  LDI r5, 500
  LDI r14, 32
  WPIXEL
endif_1:
  HALT
