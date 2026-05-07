; subroutine calls
; initialization
  LDI r8, 0x138B97
  LDI r0, 0x23FBBA
  LDI r9, 0x90CA3B
  LDI r13, 2006
  CALL func_0
func_0:
  XOR r7, r15, r0
  SHR r29, r11, r0
  SUB r30, r4, r11
  OR r29, r10, r9
  MUL r0, r8, r7
  RET
  CALL func_1
func_1:
  XOR r5, r17, r15
  SHR r11, r12, r3
  RET
  CALL func_2
func_2:
  SUB r14, r4, r9
  SUB r3, r7, r10
  MUL r4, r6, r3
  SUB r3, r14, r5
  DIV r1, r7, r4
  XOR r6, r17, r2
  RET
  CALL func_3
func_3:
  AND r7, r1, r3
  SUB r1, r10, r9
  DIV r1, r3, r15
  RET
  HALT
