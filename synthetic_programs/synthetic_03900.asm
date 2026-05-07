; subroutine calls
; initialization
  LDI r3, 532
  LDI r10, 0xF2F92C
  LDI r0, 0x4D0914
  LDI r11, 3545
  LDI r13, 2
  LDI r6, 236
  CALL func_0
func_0:
  SUB r9, r10, r12
  SHR r6, r7, r11
  SHL r2, r5, r11
  OR r11, r13, r4
  RET
  CALL func_1
func_1:
  ADD r9, r6, r10
  SHL r8, r4, r1
  XOR r27, r7, r10
  MUL r14, r28, r3
  OR r15, r2, r24
  ADD r4, r10, r3
  RET
  HALT
