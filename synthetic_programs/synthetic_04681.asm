; mixed program
; initialization
  LDI r3, 2623
  LDI r8, 1925
  LDI r10, 941
  LDI r14, 2438
  CALL func_0
func_0:
  XOR r0, r13, r6
  MUL r0, r15, r3
  MOD r13, r3, r24
  RET
  SAR r9, r8, r0
  SHLI r10, r13, 0xF794B9
  SHR r8, r14, r9
  OR r6, r11, r1
  HALT
