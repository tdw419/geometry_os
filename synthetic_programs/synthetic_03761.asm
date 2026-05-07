; mixed program
; initialization
  LDI r12, 0xF8C19C
  LDI r14, 0xC32209
  LDI r5, 64
  LDI r3, 0xE133C3
  LDI r6, 16
  LDI r2, 0x89638F
  CALL func_0
func_0:
  SHL r2, r1, r14
  SUB r10, r7, r4
  XOR r3, r9, r0
  SUB r0, r22, r25
  RET
  IKEY r5
  CMPI r5, 0xEC9E6A
  JNZ r5, key_1
  LDI r11, 256
  LDI r14, 32
  LDI r12, 0x33C98C
  PSETI
  CMP r5, r6
  IKEY r7
  CMPI r7, 10
  JNZ r7, key_2
  PUSH r8
  PUSH r12
  PUSH r23
  DIV r5, r12, r11
  AND r1, r0, r10
  MUL r1, r13, r7
  POP r23
  POP r12
  POP r8
  HALT
