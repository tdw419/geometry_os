; mixed program
; initialization
  LDI r7, 2275
  LDI r0, 3561
  LDI r9, 8
  LDI r5, 64
  STORE r5, r1
  LOAD r13, r5
  LDI r12, 64
  STORE r12, r4
  LOAD r24, r12
  LDI r10x23BF, 3098
  STORE r12, r15
  LOAD r1, r12
  LDI r2, 1581
  STORE r2, r7
  LOAD r14, r2
  LDI r29, 256
  STORE r29, r14
  LOAD r4, r29
  XOR r8, r15, r23
  OR r8, r2, r19
  XOR r16, r20, r6
  AND r4, r11, r9
  IKEY r7
  CMPI r7, 0xE46A8B
  JNZ r7, key_0
  CMP r8, r4
  JNZ r8, else_1
  OR r5, r13, r6
  JMP endif_2
else_1:
  LDI r9, 3007
  LDI r1, 4
  LDI r1, 32
  PSETI
  LDI r1, 255
  LDI r10, 64
  LDI r18, 0x4F077C
  PSET r1, r10, r18
endif_2:
  SHR r1, r3, r7
  SHLI r3, r1, 1
  SHR r12, r4, r5
  CMPI r0, 0x730783
  HALT
