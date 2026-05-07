; subroutine calls
; initialization
  LDI r15, 1361
  LDI r1, 128
  LDI r9, 0xFD7666
  LDI r6, 255
  LDI r8, 64
  LDI r3, 1386
  LDI r14, 16
  LDI r26, 2462
  CALL func_0
func_0:
  OR r1, r15, r6
  OR r3, r13, r6
  XOR r12, r24, r11
  RET
  CALL func_1
func_1:
  SHR r4, r1, r14
  SHR r11, r14, r28
  DIV r11, r9, r1
  OR r13, r1, r10
  RET
  CALL func_2
func_2:
  AND r4, r2, r3
  ADD r30, r0, r7
  RET
  HALT
