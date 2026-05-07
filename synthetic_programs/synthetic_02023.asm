; mixed program
; initialization
  LDI r20, 2
  LDI r7, 0xDEDACD
  CMP r13, r2
  SHR r3, r15, r11
  SHR r6, r5, r7
  SAR r8, r1, r7
  LDI r8, 4
  LDI r6, 751
  LDI r2, 4
  PSETI
  CALL func_0
func_0:
  DIV r9, r4, r11
  DIV r1, r6, r5
  RET
  HALT
