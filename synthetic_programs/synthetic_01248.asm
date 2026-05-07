; input driven program
; initialization
  LDI r8, 2763
  LDI r12, 0x180B2F
  LDI r2, 1358
  LDI r13, 2
  LDI r14, 0x9B5328
main_0:
  OR r1, r8, r29
  IKEY r12
  CMPI r12, 128
  JNZ r12, key_1
  ADDI r4, r0, 205
  SHL r8, r3, r2
  SAR r12, r14, r9
  MOD r3, r1, r8
  FRAME
  JMP main_0
