; subroutine calls
; initialization
  LDI r13, 0x1ABF5E
  LDI r12, 4
  LDI r1, 0x53B118
  LDI r15, 0x855B5C
  LDI r6, 0x8470D9
  LDI r14, 128
  CALL func_0
func_0:
  MOD r1, r0, r4
  SUB r7, r22, r14
  RET
  CALL func_1
func_1:
  SHL r6, r7, r11
  MUL r2, r4, r14
  MUL r0, r15, r2
  SHR r10, r1, r14
  RET
  HALT
