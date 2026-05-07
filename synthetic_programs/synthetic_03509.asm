; mixed program
; initialization
  LDI r1, 0xF989BF
  LDI r3, 32
  LDI r14, 109
  LDI r0, 2425
  CALL func_0
func_0:
  MUL r12, r7, r11
  AND r11, r4, r12
  SHR r12, r0, r8
  MOD r6, r4, r13
  RET
  XOR r7, r6, r15
  AND r27, r2, r8
  AND r7, r14, r3
  LDI r1, 2285
  LDI r9, 3721
  LDI r5, 1
  PSETI
  CALL func_1
func_1:
  DIV r12, r14, r8
  OR r19, r9, r1
  RET
  CMPI r15, 128
  LDI r11, 1
loop_2:
  ADDI r12, r9, 218
  LDI r13, 1
  SUB r11, r11, r13
  JNZ r11, loop_2
  IKEY r6
  CMPI r6, 50
  JNZ r6, key_3
  CMP r1, r22
  HALT
