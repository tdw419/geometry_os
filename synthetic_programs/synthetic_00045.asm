; mixed program
; initialization
  LDI r7, 0x67C094
  LDI r12, 1125
  XOR r2, r4, r5
  PUSH r14
  PUSH r1
  PUSH r12
  ADD r2, r5, r9
  SHR r15, r6, r8
  OR r7, r1, r15
  POP r12
  POP r1
  POP r14
  CALL func_0
func_0:
  MOD r0, r6, r3
  XOR r7, r6, r4
  RET
  IKEY r15
  CMPI r15, 0
  JNZ r15, key_1
main_2:
  SHLI r14, r1, 0
  SHLI r2, r14, 4
  AND r3, r13, r12
  AND r15, r13, r14
  CMP r6, r8
  IKEY r1
  CMPI r1, 2
  JNZ r1, key_3
  FRAME
  JMP main_2
