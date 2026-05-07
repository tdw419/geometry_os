; mixed program
; initialization
  LDI r13, 0xAA7EB3
  LDI r5, 2742
  LDI r11, 0xCB0EA3
  PUSH r12
  PUSH r1
  PUSH r7
  XOR r7, r2, r3
  SUB r12, r3, r1
  POP r7
  POP r1
  POP r12
  CALL func_0
func_0:
  SUB r7, r9, r0
  ADD r12, r5, r27
  OR r4, r2, r3
  SUB r1, r6, r5
  RET
  CMPI r7, 0xAA3055
  CALL func_1
func_1:
  SHR r0, r15, r13
  DIV r2, r15, r10
  RET
  CMP r4, r10
  JNZ r4, else_2
  SHL r3, r7, r13
  JMP endif_3
else_2:
  LDI r5, 0x43A2A0
  LDI r12, 2163
  LDI r5, 0xE6848A
  PSETI
  LDI r4, 0x557D66
  LDI r2, 10
  LDI r2, 0x8518A6
  LDI r15, 0xD5DAB0
  LDI r1, 1510
  RECTF r4, r2, r2, r15, r1
endif_3:
  HALT
