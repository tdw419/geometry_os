; subroutine calls
; initialization
  LDI r12, 2
  LDI r3, 1541
  LDI r18, 1308
  LDI r15, 0
  LDI r7, 128
  LDI r5, 170
  LDI r1, 255
  LDI r11, 4031
  CALL func_0
func_0:
  OR r25, r6, r14
  XOR r14, r0, r3
  SHR r4, r2, r6
  MUL r13, r10, r2
  SUB r13, r3, r12
  RET
  CALL func_1
func_1:
  OR r11, r8, r14
  ADD r8, r14, r11
  ADD r9, r13, r10
  OR r0, r15, r9
  RET
  CALL func_2
func_2:
  XOR r9, r12, r15
  SHL r8, r2, r13
  OR r5, r10, r14
  DIV r10, r15, r9
  XOR r0, r3, r9
  RET
  HALT
