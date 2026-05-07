; subroutine calls
; initialization
  LDI r10, 1
  LDI r7, 128
  LDI r3, 1196
  LDI r18, 2
  LDI r30, 0xBF49B6
  LDI r4, 1601
  LDI r11, 16
  CALL func_0
func_0:
  ADD r11, r14, r12
  SHL r5, r10, r11
  RET
  CALL func_1
func_1:
  SHL r15, r9, r5
  AND r6, r2, r8
  SHL r13, r4, r7
  XOR r14, r8, r2
  SUB r4, r7, r9
  ADD r2, r8, r0
  RET
  CALL func_2
func_2:
  MUL r15, r28, r4
  MOD r8, r15, r7
  AND r14, r2, r1
  XOR r8, r14, r31
  SHR r8, r14, r15
  RET
  HALT
