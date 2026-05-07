; subroutine calls
; initialization
  LDI r11, 0x146B89
  LDI r0, 1010
  LDI r13, 256
  LDI r15, 32
  LDI r1, 2878
  LDI r6, 0
  CALL func_0
func_0:
  SHL r9, r12, r10
  SHR r1, r2, r13
  SHR r1, r3, r4
  SHL r8, r12, r0
  OR r11, r2, r9
  RET
  CALL func_1
func_1:
  MUL r2, r26, r4
  DIV r9, r10, r11
  SUB r8, r6, r5
  RET
  CALL func_2
func_2:
  DIV r15, r9, r3
  XOR r7, r9, r16
  DIV r7, r4, r13
  SHL r6, r5, r9
  SHR r6, r9, r13
  RET
  HALT
