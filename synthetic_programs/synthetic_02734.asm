; mixed program
; initialization
  LDI r12, 1581
  LDI r4, 3936
  AND r12, r7, r24
  XOR r21, r0, r14
  XOR r1, r10, r11
  AND r1, r6, r3
  LDI r5, 12
loop_0:
  OR r7, r0, r14
  XOR r12, r7, r2
  LDI r30, 1231
  FILL r30
  LDI r1, 1
  SUB r5, r5, r1
  JNZ r5, loop_0
  PUSH r0
  SHL r9, r10, r13
  ADD r10, r0, r14
  DIV r8, r1, r11
  POP r0
  SUB r8, r2, r0
  IKEY r4
  CMPI r4, 0x093EB1
  JNZ r4, key_1
  CALL func_2
func_2:
  OR r0, r13, r10
  OR r3, r14, r4
  RET
  SHL r10, r13, r15
  SHR r12, r8, r10
  SAR r10, r13, r3
main_3:
  SHLI r1, r14, 8
  SAR r11, r6, r0
  SHL r9, r2, r11
  IKEY r7
  CMPI r7, 0x44C12C
  JNZ r7, key_4
  FRAME
  JMP main_3
