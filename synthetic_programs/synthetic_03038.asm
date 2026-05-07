; subroutine calls
; initialization
  LDI r8, 0xC151D6
  LDI r4, 2
  LDI r6, 2964
  LDI r14, 1062
  LDI r12, 16
  LDI r1, 0xD70DAE
  LDI r0, 32
  CALL func_0
func_0:
  SHL r11, r15, r1
  OR r11, r15, r10
  RET
  CALL func_1
func_1:
  SHL r12, r14, r5
  OR r9, r14, r27
  RET
  CALL func_2
func_2:
  XOR r10, r12, r8
  MOD r10, r7, r5
  DIV r0, r13, r8
  SUB r7, r13, r6
  SUB r15, r8, r0
  RET
  CALL func_3
func_3:
  MUL r5, r7, r14
  MOD r14, r3, r0
  SHL r14, r8, r2
  MUL r1, r15, r6
  OR r3, r4, r7
  DIV r14, r6, r12
  RET
  HALT
