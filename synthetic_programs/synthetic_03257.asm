; mixed program
; initialization
  LDI r15, 3676
  LDI r5, 2312
  IKEY r2
  CMPI r2, 0xE3764E
  JNZ r2, key_0
  LDI r5, 32
  STORE r5, r8
  LOAD r12, r5
  LDI r7, 0x3AB5EB
  STORE r7, r2
  LOAD r12, r7
  OR r8, r15, r0
  OR r14, r12, r15
  XOR r2, r4, r14
  AND r10, r20, r6
  XOR r1, r8, r13
  CALL func_1
func_1:
  SHR r8, r14, r5
  SHL r7, r10, r5
  OR r10, r6, r1
  MOD r0, r14, r12
  DIV r12, r3, r15
  RET
  HALT
