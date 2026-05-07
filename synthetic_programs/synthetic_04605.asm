; subroutine calls
; initialization
  LDI r10, 256
  LDI r1, 64
  LDI r5, 10
  LDI r15, 0xF40A44
  LDI r0, 0xB4E16D
  LDI r2, 10
  LDI r14, 4
  CALL func_0
func_0:
  ADD r12, r13, r5
  SHR r11, r12, r3
  MUL r12, r7, r1
  ADD r3, r2, r24
  SHR r14, r3, r6
  RET
  CALL func_1
func_1:
  SUB r10, r11, r0
  MOD r10, r14, r11
  AND r2, r15, r5
  MUL r9, r13, r2
  XOR r2, r8, r4
  RET
  HALT
