; mixed program
; initialization
  LDI r8, 0xC1590E
  LDI r10, 0xBCABC8
  LDI r11, 966
  OR r7, r1, r12
  OR r12, r10, r11
  AND r2, r5, r9
  OR r0, r2, r3
  CALL func_0
func_0:
  SHL r14, r8, r3
  SHL r3, r7, r12
  SHR r11, r12, r6
  RET
  LDI r4, 64
  FILL r4
main_1:
  SHR r9, r5, r10
  SHR r2, r8, r3
  SAR r13, r5, r11
  SHR r11, r6, r13
  SUBI r2, r13, 0xEBD94F
  SHR r0, r14, r7
  SAR r3, r8, r12
  SHLI r2, r14, 1
  SHL r11, r4, r9
  IKEY r9
  CMPI r9, 0xCD9C9D
  JNZ r9, key_2
  FRAME
  JMP main_1
