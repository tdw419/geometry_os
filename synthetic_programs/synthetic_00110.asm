; mixed program
; initialization
  LDI r0, 0xDB69F0
  LDI r2, 1244
  AND r11, r2, r9
  OR r2, r16, r6
  CMPI r15, 0x95361B
  CALL func_0
func_0:
  SUB r9, r14, r8
  MUL r3, r7, r1
  SHR r5, r14, r9
  MOD r12, r7, r9
  SHL r14, r4, r1
  XOR r4, r14, r2
  RET
main_1:
  AND r13, r9, r6
  OR r11, r6, r1
  AND r8, r15, r12
  XOR r14, r10, r13
  XOR r5, r29, r10
  AND r4, r15, r22
  XOR r1, r11, r3
  OR r6, r10, r8
  SUBI r1, r9, 22
  SHL r2, r13, r7
  SAR r7, r9, r1
  SHR r8, r0, r1
  FRAME
  JMP main_1
