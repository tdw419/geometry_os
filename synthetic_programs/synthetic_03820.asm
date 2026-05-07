; input driven program
; initialization
  LDI r3, 0xD9E6D3
  LDI r12, 0x6F62A3
  LDI r8, 10
  LDI r2, 2660
  LDI r15, 1
main_0:
  ADD r26, r0, r7
  IKEY r14
  CMPI r14, 117
  JNZ r14, key_1
  ADD r14, r8, r7
  DIV r15, r0, r12
  FRAME
  JMP main_0
