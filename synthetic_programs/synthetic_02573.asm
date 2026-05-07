; mixed program
; initialization
  LDI r10, 3959
  LDI r7, 1888
  OR r12, r1, r5
  OR r3, r14, r8
  AND r6, r2, r5
  SAR r8, r10, r15
  SHLI r10, r9, 8
  SHL r15, r12, r2
  SHL r5, r2, r6
  LDI r6, 1768
  LDI r3, 0xCDEC0F
  LDI r14, 1068
  DRAWTEXT r6, r3, r14, "WORLD"
  CALL func_0
func_0:
  ADD r0, r1, r2
  MOD r5, r6, r9
  ADD r3, r13, r8
  OR r12, r7, r1
  SUB r7, r1, r14
  RET
  IKEY r6
  CMPI r6, 211
  JNZ r6, key_1
main_2:
  CMPI r11, r3, 102
  OR r8, r3, r0
  AND r14, r3, r13
  XOR r3, r7, r13
  OR r12, r13, r2
  LDI r1, 0x785AFF
  LDI r7, 985
  LDI r15, 839
  DRAWTEXT r1, r7, r15, "WORLD"
  SAR r10, r3, r12
  SHR r17, r3, r0
  SHR r13, r31, r14
  SHR r5, r11, r4
  SHLI r8, r9, 0
  SUBI r5, r8, 0xD422B2
  FRAME
  JMP main_2
