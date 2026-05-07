; mixed program
; initialization
  LDI r8, 0
  LDI r1, 128
  CALL func_0
func_0:
  OR r15, r6, r9
  DIV r10, r2, r26
  AND r15, r2, r13
  RET
  SHL r11, r13, r1
  SAR r10, r12, r6
  SHL r12, r8, r16
  SHL r7, r14, r13
  SHLI r8, r5, 5
  SHL r7, r12, r3
main_1:
  LDI r2, 3387
  LDI r21, 16
  LDI r9, 16
  LDI r3, 2951
  LDI r9, 2
  RECTF r2, r21, r9, r3, r9
  LDI r0, 0
  LDI r10, 704
  LDI r14, 10
  DRAWTEXT r0, r10, r14, "WORLD"
  CMPI r12, 0
  FRAME
  JMP main_1
