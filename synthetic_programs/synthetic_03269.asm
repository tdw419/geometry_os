; subroutine calls
; initialization
  LDI r2, 32
  LDI r13, 0xA75EAF
  LDI r12, 10
  LDI r5, 0xCF1E8E
  LDI r8, 32
  LDI r11, 2780
  LDI r3, 128
  CALL func_0
func_0:
  SUB r12, r8, r10
  SHR r7, r14, r9
  MUL r0, r12, r6
  MUL r12, r9, r5
  RET
  CALL func_1
func_1:
  SHL r9, r1, r3
  SUB r7, r3, r11
  ADD r0, r5, r7
  AND r4, r7, r2
  RET
  HALT
