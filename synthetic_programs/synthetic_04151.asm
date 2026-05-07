; mixed program
; initialization
  LDI r12, 2576
  LDI r1, 0x08C77B
  LDI r15, 0xC479A0
  STORE r15, r14
  LOAD r12, r15
  LDI r2, 2
  STORE r2, r3
  LOAD r8, r2
  LDI r22, 64
  LDI r3, 0xF70C48
  LDI r0, 2571
  PSET r22, r3, r0
  XOR r5, r0, r3
  OR r8, r14, r12
  LDI r1, 64
  FILL r1
  LDI r5, 0xD8D454
  LDI r15, 1020
  LDI r0, 1667
  TEXT r5, r15, r0, "HELLO"
  CMPI r9, 37
  LDI r10, 4
  STORE r10, r13
  LOAD r9, r10
  LDI r9, 0x4351A3
  STORE r9, r15
  LOAD r6, r9
  LDI r9, 128
  STORE r9, r13
  LOAD r7, r9
  LDI r14, 8
  STORE r14, r14
  LOAD r12, r14
main_0:
  ADDI r0, r20, 77
  IKEY r14
  CMPI r14, 193
  JNZ r14, key_1
  FRAME
  JMP main_0
