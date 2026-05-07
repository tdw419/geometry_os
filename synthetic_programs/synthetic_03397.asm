; mixed program
; initialization
  LDI r4, 3061
  LDI r1, 3774
  LDI r13, 10
  LDI r6, 0xFF3D37
  CMP r6, r2
  CALL func_0
func_0:
  SHR r0, r14, r12
  DIV r8, r7, r14
  OR r2, r8, r5
  MOD r11, r10, r9
  RET
  ADD r8, r14, r5
  SHL r18, r4, r5
  SHR r7, r13, r12
  SHLI r9, r13, 5
  SHR r4, r13, r18
main_1:
  OR r0, r3, r14
  LDI r4, 0x37A6BB
  LDI r8, 32
  LDI r4, 0x55AC31
  LDI r5, 255
  CIRCLE r4, r8, r4, r5
  CMPI r8, 0x6FC7B3
  IKEY r3
  CMPI r3, 216
  JNZ r3, key_2
  SUB r12, r9, r10
  FRAME
  JMP main_1
