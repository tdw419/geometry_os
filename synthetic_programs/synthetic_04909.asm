; mixed program
; initialization
  LDI r10, 308
  LDI r14, 677
  LDI r7, 1094
  LDI r11, 1091
  LDI r12, 32
  DIV r9, r3, r10
  LDI r13, 0x8C89AD
  LDI r4, 1
  LDI r8, 256
  DRAWTEXT r13, r4, r8, "WORLD"
  LDI r1, 256
  STORE r1, r9
  LOAD r5, r1
  LDI r3, 2
  STORE r3, r7
  LOAD r2, r3
  CALL func_0
func_0:
  OR r9, r4, r12
  DIV r27, r15, r7
  DIV r12, r2, r9
  SHR r4, r15, r10
  DIV r21, r2, r15
  MUL r1, r3, r12
  RET
main_1:
  LDI r12, 128
  LDI r15, 128
  LDI r6, 1
  LDI r7, 0xC4776A
  CIRCLE r12, r15, r6, r7
  XOR r12, r9, r7
  AND r11, r10, r9
  AND r8, r0, r14
  IKEY r11
  CMPI r11, 0xBC5F97
  JNZ r11, key_2
  AND r0, r8, r14
  OR r11, r20, r14
  AND r1, r20, r4
  AND r10, r5, r6
  FRAME
  JMP main_1
