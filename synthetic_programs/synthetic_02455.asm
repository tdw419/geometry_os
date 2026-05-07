; subroutine calls
; initialization
  LDI r8, 0x9BB3F1
  LDI r6, 2291
  LDI r27, 0xFE163C
  LDI r1, 0x7A1DBD
  LDI r11, 3763
  LDI r9, 0xE90069
  LDI r13, 0xE785EA
  CALL func_0
func_0:
  ADD r0, r12, r6
  AND r6, r12, r3
  MUL r8, r9, r15
  SUB r26, r27, r12
  ADD r9, r3, r14
  RET
  CALL func_1
func_1:
  ADD r8, r5, r7
  DIV r10, r3, r1
  DIV r7, r1, r13
  XOR r1, r8, r12
  RET
  HALT
