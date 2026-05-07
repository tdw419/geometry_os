; mixed program
; initialization
  LDI r15, 1
  LDI r1, 0xD6E512
  LDI r0, 0x7356DD
  LDI r12, 0x9EC2B3
  LDI r4, 4
  LDI r7, 3100
  LDI r8, 3807
  LDI r2, 692
  IKEY r9
  CMPI r9, 0x89A6FA
  JNZ r9, key_0
  PUSH r2
  PUSH r28
  PUSH r7
  SHL r7, r1, r9
  DIV r0, r22, r3
  XOR r7, r10, r0
  AND r5, r11, r30
  SHL r10, r6, r12
  POP r7
  POP r28
  POP r2
  IKEY r5
  CMPI r5, 211
  JNZ r5, key_1
  LDI r4, 0x1AD94F
  LDI r1, 0xEDBB30
  LDI r13, 16
  DRAWTEXT r4, r1, r13, "WORLD"
  SHLI r7, r12, 0xAFE69B
  SHLI r3, r13, 0
  CALL func_2
func_2:
  DIV r13, r15, r0
  MUL r13, r10, r5
  MUL r1, r9, r12
  AND r15, r6, r10
  DIV r12, r8, r11
  MOD r5, r9, r0
  RET
main_3:
  SHR r5, r2, r14
  SHR r11, r12, r0
  CMPI r10, 114
  OR r5, r4, r10
  AND r8, r9, r12
  FRAME
  JMP main_3
