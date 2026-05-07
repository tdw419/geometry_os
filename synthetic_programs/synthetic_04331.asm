; mixed program
; initialization
  LDI r10, 0x9A7BE3
  LDI r4, 369
  LDI r5, 408
  LDI r6, 0xC9BCB8
  LDI r14, 2
  LDI r12, 1777
  OR r23, r13, r2
  OR r12, r3, r15
  XOR r0, r5, r4
  SHL r3, r19, r1
  SAR r13, r14, r10
  SHR r3, r15, r2
  SAR r9, r12, r14
  CALL func_0
func_0:
  SUB r0, r1, r5
  DIV r6, r8, r0
  RET
  CMPI r5, 176
main_1:
  SHR r0, r2, r3
  SHR r6, r11, r4
  SHLI r2, r9, 0x8A416D
  SHLI r8, r4, 0x0776C0
  CMPI r2, 129
  FRAME
  JMP main_1
