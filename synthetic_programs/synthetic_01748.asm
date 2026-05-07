; mixed program
; initialization
  LDI r13, 0x35AA59
  LDI r5, 10
  LDI r6, 0x877A84
  LDI r27, 0
  LDI r3, 4
  LDI r1, 1853
  MUL r0, r8, r14
  LDI r6, 64
  LDI r12, 10
  LDI r7, 0x25C7D3
  LDI r14, 16
  CIRCLE r6, r12, r7, r14
  AND r2, r12, r0
  AND r7, r13, r9
  OR r2, r4, r14
  XOR r4, r11, r1
  OR r3, r9, r5
  CALL func_0
func_0:
  SUB r4, r10, r22
  MOD r6, r5, r2
  MOD r3, r6, r10
  MOD r10, r12, r15
  MOD r8, r5, r12
  RET
main_1:
  CMPI r0, r14, 100
  LDI r8, 0x20851B
  LDI r8, 64
  LDI r13, 1550
  TEXT r8, r8, r13, "HELLO"
  CMP r6, r7
  FRAME
  JMP main_1
