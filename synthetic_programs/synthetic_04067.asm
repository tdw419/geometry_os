; mixed program
; initialization
  LDI r8, 10
  LDI r1, 0xCEF504
  LDI r0, 1
  LDI r21, 1
  XOR r9, r3, r5
  AND r12, r4, r2
  OR r2, r10, r4
  CALL func_0
func_0:
  SHL r2, r23, r13
  XOR r7, r1, r5
  SHL r15, r5, r7
  OR r2, r25, r3
  MOD r7, r8, r15
  RET
  CMPI r6, 136
  CMP r3, r7
  CALL func_1
func_1:
  XOR r10, r3, r19
  OR r15, r2, r14
  AND r0, r6, r3
  SHR r12, r9, r15
  OR r4, r13, r2
  SUB r4, r6, r7
  RET
  LDI r7, 2
  LDI r7, 2395
  LDI r5, 0x93496A
  TEXT r7, r7, r5, "HELLO"
  LDI r7, 1
loop_2:
  ANDI r12, r14, 128
  ANDI r7, r9, 0x0AA865
  LDI r15, 1
  SUB r7, r7, r15
  JNZ r7, loop_2
  LDI r4, 566
  FILL r4
  HALT
