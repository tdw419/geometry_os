; mixed program
; initialization
  LDI r6, 2911
  LDI r13, 255
  LDI r4, 376
  CALL func_0
func_0:
  SUB r13, r9, r5
  XOR r9, r11, r15
  XOR r13, r1, r0
  MUL r15, r1, r10
  MUL r6, r14, r4
  SUB r11, r1, r12
  RET
  CMPI r8, 0
  LDI r13, 0x78BDA0
  LDI r11, 0x4FB285
  LDI r4, 255
  LDI r8, 0x1B7891
  CIRCLE r13, r11, r4, r8
  IKEY r10
  CMPI r10, 145
  JNZ r10, key_1
  LDI r5, 0x90F02E
  LDI r6, 32
  LDI r0, 1739
  PSETI
  PUSH r1
  PUSH r14
  MUL r0, r6, r3
  OR r10, r7, r4
  POP r14
  POP r1
  XOR r15, r10, r12
  AND r14, r7, r9
  XOR r9, r3, r12
  HALT
