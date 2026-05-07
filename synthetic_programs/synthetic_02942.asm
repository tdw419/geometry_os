; mixed program
; initialization
  LDI r8, 4
  LDI r1, 255
  LDI r15, 255
  LDI r3, 1425
  LDI r5, 1
  LDI r14, 0x0E61F5
  LDI r4, 2494
  IKEY r4
  CMPI r4, 0xDEE37F
  JNZ r4, key_0
  CALL func_1
func_1:
  MUL r2, r3, r6
  OR r5, r6, r15
  XOR r15, r5, r10
  SUB r11, r14, r13
  DIV r3, r15, r4
  SHL r4, r12, r0
  RET
  XOR r5, r15, r10
  IKEY r9
  CMPI r9, 256
  JNZ r9, key_2
  PUSH r1
  PUSH r2
  PUSH r9
  MOD r9, r8, r10
  SHL r8, r12, r18
  OR r13, r9, r12
  AND r14, r3, r4
  POP r9
  POP r2
  POP r1
  HALT
