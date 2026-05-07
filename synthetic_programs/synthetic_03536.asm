; conditional logic
; initialization
  LDI r12, 3806
  LDI r7, 256
  LDI r5, 475
  LDI r6, 10
  LDI r8, 8
  LDI r4, 4067
  LDI r0, 32
  LDI r10, 3436
  CMP r0, r15
  JNZ r0, else_0
  SUB r4, r5, r1
  AND r5, r10, r2
  JMP endif_1
else_0:
  LDI r13, 2
  FILL r13
  LDI r0, 363
  LDI r8, 2396
  LDI r10, 0xD166DB
  LDI r9, 0x8D8C7F
  LDI r3, 4
  LINE r0, r8, r10, r9, r3
endif_1:
  HALT
