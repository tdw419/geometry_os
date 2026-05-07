; input driven program
; initialization
  LDI r2, 0x61DD16
  LDI r8, 411
  LDI r12, 0x7601CE
main_0:
  SHR r15, r4, r8
  SHR r14, r15, r7
  MOD r4, r3, r12
  IKEY r3
  CMPI r3, 16
  JNZ r3, key_1
  FRAME
  JMP main_0
