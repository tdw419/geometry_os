; input driven program
; initialization
  LDI r12, 256
  LDI r0, 224
  LDI r10, 0xBA7824
main_0:
  SHR r9, r1, r14
  IKEY r3
  CMPI r3, 0xF8B70B
  JNZ r3, key_1
  FRAME
  JMP main_0
