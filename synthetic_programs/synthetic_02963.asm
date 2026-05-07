; input driven program
; initialization
  LDI r1, 128
  LDI r2, 128
main_0:
  IKEY r14
  CMPI r14, 195
  JNZ r14, key_1
  MOD r3, r2, r8
  FRAME
  JMP main_0
