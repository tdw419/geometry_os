; conditional logic
; initialization
  LDI r7, 1
  LDI r1, 1978
  LDI r2, 10
  LDI r10, 8
  LDI r14, 0xCA7C05
  LDI r19, 4
  LDI r6, 4
  LDI r0, 8
  CMP r9, r0
  JNZ r9, else_0
  MOD r6, r15, r13
  OR r10, r12, r6
  JMP endif_1
else_0:
  LDI r0, 0x94F25E
  LDI r6, 16
  LDI r1, 0xFA6278
  LDI r15, 256
  CIRCLE r0, r6, r1, r15
endif_1:
  HALT
