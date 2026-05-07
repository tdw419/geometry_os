; conditional logic
; initialization
  LDI r9, 128
  LDI r1, 3074
  LDI r2, 0x94E545
  LDI r5, 0
  LDI r11, 0x7EFD8C
  LDI r3, 0xFD2805
  LDI r8, 10
  LDI r6, 0x63B816
  CMP r14, r10
  JNZ r14, else_0
  OR r4, r2, r14
  DIV r13, r11, r12
  JMP endif_1
else_0:
  LDI r4, 4
  LDI r7, 4
  LDI r12, 526
  LDI r7, 202
  CIRCLE r4, r7, r12, r7
endif_1:
  HALT
