; mixed program
; initialization
  LDI r8, 10
  LDI r15, 8
  CALL func_0
func_0:
  SUB r15, r8, r9
  AND r9, r7, r5
  DIV r10, r7, r2
  DIV r13, r3, r2
  DIV r15, r3, r0
  RET
  LDI r2, 1727
  LDI r14, 518
  LDI r6, 0x1E537A
  WPIXEL
  SHLI r0, r7, 7
  SHL r10, r6, r7
  OR r5, r14, r6
  XOR r7, r12, r13
  OR r11, r14, r8
  LDI r13, 0x251DC3
  STORE r13, r5
  LOAD r6, r13
  LDI r2, 16
  STORE r2, r2
  LOAD r11, r2
  HALT
