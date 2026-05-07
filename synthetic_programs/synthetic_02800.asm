; conditional logic
; initialization
  LDI r12, 0
  LDI r1, 0xE46CE6
  LDI r27, 3400
  CMP r2, r12
  JNZ r2, else_0
  MOD r13, r15, r26
  SHR r2, r7, r4
  JMP endif_1
else_0:
  LDI r1, 0x4CBA12
  LDI r12, 0
  LDI r8, 1024
  LDI r14, 0x796FF7
  LDI r3, 32
  LINE r1, r12, r8, r14, r3
  LDI r7, 8
  LDI r13, 255
  LDI r1, 854
  LDI r1, 0
  CIRCLE r7, r13, r1, r1
endif_1:
  HALT
