; subroutine calls
; initialization
  LDI r1, 3087
  LDI r9, 1550
  LDI r7, 0x5FAF24
  LDI r11, 32
  LDI r10, 0x089842
  CALL func_0
func_0:
  SHR r5, r4, r15
  MUL r3, r15, r5
  DIV r13, r21, r1
  ADD r3, r5, r11
  MOD r2, r6, r4
  RET
  CALL func_1
func_1:
  OR r3, r9, r0
  OR r6, r15, r2
  RET
  CALL func_2
func_2:
  SHL r12, r14, r10
  ADD r0, r8, r3
  MUL r10, r14, r7
  SHL r12, r1, r10
  MUL r9, r7, r8
  RET
  HALT
