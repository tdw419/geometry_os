; subroutine calls
; initialization
  LDI r3, 0x9BCF4E
  LDI r11, 3067
  LDI r13, 0xE7B93D
  LDI r9, 32
  LDI r15, 4
  LDI r2, 325
  LDI r12, 255
  LDI r10, 0xF62306
  CALL func_0
func_0:
  MOD r0, r11, r12
  SHL r11, r8, r7
  MOD r11, r15, r2
  ADD r12, r3, r10
  XOR r16, r11, r12
  RET
  CALL func_1
func_1:
  MUL r8, r15, r11
  ADD r15, r5, r14
  MUL r8, r4, r1
  SUB r14, r12, r30
  SUB r8, r1, r0
  AND r1, r7, r9
  RET
  CALL func_2
func_2:
  XOR r8, r10, r3
  AND r3, r10, r5
  ADD r5, r9, r0
  RET
  HALT
