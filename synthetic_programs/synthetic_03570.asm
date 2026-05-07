; mixed program
; initialization
  LDI r9, 1940
  LDI r10, 2105
  LDI r8, 2901
  LDI r7, 128
  LDI r13, 3532
  LDI r12, 958
  LDI r3, 3140
  TEXT r13, r12, r3, "HELLO"
  MOD r5, r15, r9
  CALL func_0
func_0:
  SUB r0, r4, r5
  SHR r9, r15, r1
  AND r10, r1, r14
  MUL r14, r11, r5
  RET
main_1:
  IKEY r15
  CMPI r15, 208
  JNZ r15, key_2
  CMPI r12, r11, 66
  FRAME
  JMP main_1
