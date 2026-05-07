; mixed program
; initialization
  LDI r5, 256
  LDI r0, 957
  LDI r4, 16
  SHLI r20, r9, 0x424420
  SHL r2, r7, r9
  SAR r6, r4, r2
  SHL r1, r3, r14
  IKEY r9
  CMPI r9, 8
  JNZ r9, key_0
  CALL func_1
func_1:
  SUB r0, r1, r12
  SUB r7, r4, r2
  SUB r0, r15, r13
  XOR r4, r14, r7
  RET
  IKEY r5
  CMPI r5, 2
  JNZ r5, key_2
  PUSH r3
  PUSH r5
  OR r17, r6, r7
  AND r3, r2, r15
  SUB r4, r1, r8
  SHL r4, r13, r12
  SHR r10, r9, r12
  POP r5
  POP r3
  PUSH r0
  PUSH r4
  PUSH r12
  PUSH r13
  SHL r9, r2, r11
  XOR r2, r1, r0
  SHR r9, r5, r11
  SHL r9, r12, r15
  POP r13
  POP r12
  POP r4
  POP r0
  OR r15, r12, r1
  AND r11, r14, r10
  XOR r6, r7, r5
  OR r4, r1, r19
  LDI r2, 4
  LDI r4, 282
  LDI r2, 10
  TEXT r2, r4, r2, "HELLO"
  HALT
