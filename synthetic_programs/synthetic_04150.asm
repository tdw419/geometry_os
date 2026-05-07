; mixed program
; initialization
  LDI r9, 64
  LDI r3, 4
  LDI r14, 128
  LDI r10, 2654
  LDI r1, 10
  LDI r30, 0x03B53F
  LDI r11, 2838
  LDI r0, 1167
  LDI r4, 4
  LDI r4, 10
  LINE r30, r11, r0, r4, r4
  XOR r1, r7, r8
  OR r13, r7, r9
  IKEY r8
  CMPI r8, 8
  JNZ r8, key_0
  PUSH r1
  PUSH r4
  PUSH r6
  PUSH r4
  SHL r8, r11, r14
  DIV r4, r2, r14
  OR r10, r28, r22
  POP r4
  POP r6
  POP r4
  POP r1
  CALL func_1
func_1:
  DIV r9, r10, r7
  SUB r15, r9, r14
  AND r15, r2, r0
  MUL r12, r10, r9
  RET
  CMP r3, r15
  HALT
