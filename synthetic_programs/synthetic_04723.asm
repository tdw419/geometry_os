; mixed program
; initialization
  LDI r0, 1863
  LDI r13, 2446
  LDI r3, 0x2D7508
  CMP r5, r4
  XOR r5, r14, r9
  SUB r10, r3, r7
  LDI r2, 128
  LDI r12, 0x7C4EA7
  LDI r14, 0x67FCA2
  DRAWTEXT r2, r12, r14, "WORLD"
  SHR r6, r7, r1
  SHL r2, r1, r14
  SAR r15, r14, r6
  SHLI r4, r5, 64
  OR r12, r14, r1
  OR r13, r15, r6
  XOR r5, r10, r6
  AND r0, r5, r12
  IKEY r14
  CMPI r14, 0x5F9CB8
  JNZ r14, key_0
  CALL func_1
func_1:
  SHL r28, r1, r10
  OR r9, r13, r14
  DIV r3, r1, r13
  RET
main_2:
  CMPI r11, 4
  SHLI r3, r24, 10
  SHR r14, r0, r1
  SHL r15, r10, r0
  OR r2, r25, r10
  AND r8, r23, r7
  OR r14, r13, r6
  XOR r6, r13, r12
  FRAME
  JMP main_2
