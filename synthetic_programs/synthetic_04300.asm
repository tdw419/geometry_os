; subroutine calls
; initialization
  LDI r3, 0x0E7181
  LDI r9, 0xA07643
  LDI r13, 2478
  LDI r6, 0x3C4D58
  LDI r1, 0x36EB93
  LDI r7, 4
  LDI r15, 0
  CALL func_0
func_0:
  OR r6, r9, r14
  MUL r11, r14, r9
  RET
  CALL func_1
func_1:
  MUL r1, r8, r6
  MOD r7, r5, r12
  SUB r13, r9, r5
  RET
  CALL func_2
func_2:
  ADD r2, r6, r10
  XOR r5, r11, r10
  SUB r26, r10, r13
  OR r27, r29, r8
  SHR r8, r7, r13
  RET
  HALT
