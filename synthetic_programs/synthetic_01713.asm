; mixed program
; initialization
  LDI r0, 64
  LDI r9, 32
  LDI r14, 8
  LDI r5, 1985
  LDI r15, 8
  LDI r9, 0x118DB3
  TEXT r5, r15, r9, "HELLO"
  LDI r2, 3989
  STORE r2, r12
  LOAD r9, r2
  LDI r0, 1
  STORE r0, r2
  LOAD r7, r0
  LDI r13, 0x70B5
  STORE r13, r3
  LOAD r7, r13
  LDI r12, 1933
  STORE r12, r20
  LOAD r1, r12
  LDI r8, 64
  STORE r8, r0
  LOAD r1, r8
  SHR r0, r14, r12
  SHR r12, r31, r10
  SAR r6, r4, r9
  IKEY r1
  CMPI r1, 0xD8DD07
  JNZ r1, key_0
  LDI r13, 4
  STORE r13, r6
  LOAD r8, r13
  LDI r19, 1
  STORE r19, r8
  LOAD r3, r19
  LDI r14, 1796
  STORE r14, r11
  LOAD r10, r14
  LDI r6, 0
  STORE r6, r14
  LOAD r12, r6
  LDI r1, 16
  STORE r1, r14
  LOAD r29, r1
  HALT
