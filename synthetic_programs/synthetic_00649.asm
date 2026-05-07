; mixed program
; initialization
  LDI r2, 0x0AA06B
  LDI r9, 0x2ACD09
  CALL func_0
func_0:
  MUL r11, r6, r7
  SHR r9, r5, r13
  MUL r12, r10, r15
  SUB r13, r11, r9
  SHL r5, r1, r7
  DIV r28, r1, r4
  RET
  CMPI r11, 32
  XOR r14, r13, r6
  XOR r9, r12, r8
  HALT
