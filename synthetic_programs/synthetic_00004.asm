; subroutine calls
; initialization
  LDI r10, 3495
  LDI r14, 3888
  LDI r7, 64
  LDI r2, 10
  LDI r4, 16
  LDI r6, 128
  LDI r0, 3116
  LDI r11, 0xC7AC54
  CALL func_0
func_0:
  OR r7, r8, r0
  SHR r12, r14, r0
  SHR r0, r13, r14
  MUL r12, r14, r13
  MOD r15, r1, r27
  DIV r1, r7, r0
  RET
  CALL func_1
func_1:
  MUL r15, r6, r8
  SHL r3, r5, r19
  XOR r9, r12, r6
  SUB r7, r9, r3
  XOR r11, r10, r13
  AND r11, r14, r13
  RET
  CALL func_2
func_2:
  OR r24, r15, r8
  SHL r2, r14, r12
  SHL r10, r6, r8
  RET
  CALL func_3
func_3:
  MOD r8, r6, r13
  AND r7, r15, r0
  SUB r12, r9, r11
  AND r11, r10, r14
  RET
  HALT
