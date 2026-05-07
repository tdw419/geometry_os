; mixed program
; initialization
  LDI r0, 255
  LDI r10, 4
  LDI r4, 2077
  LDI r15, 2069
  SAR r8, r0, r7
  SAR r1, r14, r9
  SHR r15, r2, r7
  SHR r13, r1, r5
  CALL func_0
func_0:
  DIV r2, r12, r5
  SHL r13, r11, r10
  OR r13, r29, r7
  SHR r11, r5, r8
  SHL r5, r0, r3
  MOD r4, r13, r8
  RET
  IKEY r13
  CMPI r13, 64
  JNZ r13, key_1
  CMPI r10, 243
  LDI r13, 128
  LDI r12, 2123
  LDI r28, 2902
  DRAWTEXT r13, r12, r28, "WORLD"
main_2:
  LDI r25, 4
  LDI r5, 2244
  LDI r14, 2886
  DRAWTEXT r25, r5, r14, "WORLD"
  ADDI r21, r3, 0x85645A
  FRAME
  JMP main_2
