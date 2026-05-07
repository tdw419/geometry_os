; mixed program
; initialization
  LDI r4, 1224
  LDI r12, 255
  LDI r2, 10
  LDI r0, 32
  PUSH r9
  PUSH r5
  AND r10, r13, r15
  SUB r11, r5, r15
  POP r5
  POP r9
  CALL func_0
func_0:
  SUB r1, r7, r8
  OR r3, r6, r9
  RET
  CALL func_1
func_1:
  SHL r7, r6, r13
  DIV r3, r5, r1
  MOD r5, r8, r14
  RET
main_2:
  LDI r10, 64
  LDI r14, 0xA5B2F8
  LDI r11, 2877
  TEXT r10, r14, r11, "HELLO"
  LDI r15, 3411
  FILL r15
  FRAME
  JMP main_2
