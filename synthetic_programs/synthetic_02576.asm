; subroutine calls
; initialization
  LDI r7, 32
  LDI r13, 0x271A32
  LDI r3, 0x5A1F48
  CALL func_0
func_0:
  SHR r8, r2, r15
  XOR r11, r5, r6
  DIV r1, r13, r10
  SUB r10, r6, r5
  MUL r7, r2, r22
  MUL r14, r2, r11
  RET
  CALL func_1
func_1:
  AND r4, r9, r8
  OR r0, r13, r8
  RET
  CALL func_2
func_2:
  SHR r3, r8, r10
  OR r3, r27, r12
  RET
  CALL func_3
func_3:
  SHR r17, r13, r12
  XOR r5, r3, r0
  SHR r11, r10, r3
  OR r8, r6, r4
  RET
  HALT
