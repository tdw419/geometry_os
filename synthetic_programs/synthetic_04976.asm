; subroutine calls
; initialization
  LDI r7, 0xF029C3
  LDI r29, 0x61E210
  LDI r15, 36
  LDI r2, 3055
  CALL func_0
func_0:
  SHL r0, r30, r13
  AND r6, r8, r5
  ADD r1, r12, r30
  SHR r28, r4, r6
  RET
  CALL func_1
func_1:
  DIV r11, r8, r1
  ADD r15, r10, r11
  XOR r7, r14, r15
  SUB r4, r0, r3
  ADD r15, r7, r0
  RET
  CALL func_2
func_2:
  XOR r5, r0, r14
  MUL r5, r13, r11
  SHR r9, r1, r12
  ADD r27, r10, r1
  XOR r3, r13, r8
  XOR r11, r5, r9
  RET
  HALT
