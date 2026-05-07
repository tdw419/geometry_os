; mixed program
; initialization
  LDI r1, 0xE520B6
  LDI r5, 255
  IKEY r13
  CMPI r13, 89
  JNZ r13, key_0
  MOD r3, r0, r6
  CMP r8, r2
  OR r11, r0, r3
  AND r7, r0, r15
  OR r5, r7, r0
  AND r1, r15, r13
  CMP r3, r9
  JNZ r3, else_1
  SUB r5, r15, r22
  JMP endif_2
else_1:
  LDI r10, 255
  FILL r10
  LDI r15, 0x2AF7FD
  FILL r15
  LDI r15, 0x8E432C
  LDI r2, 1639
  LDI r10, 128
  PSET r15, r2, r10
  LDI r7, 32
  LDI r4, 0xF9DE61
  LDI r4, 3994
  LDI r6, 0x296FA0
  LDI r5, 271
  LINE r7, r4, r4, r6, r5
endif_2:
  CMP r8, r23
  PUSH r9
  PUSH r12
  SHR r2, r13, r7
  DIV r5, r1, r12
  AND r31, r0, r8
  SUB r23, r6, r12
  POP r12
  POP r9
  HALT
