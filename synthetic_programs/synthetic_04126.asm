; input driven program
; initialization
  LDI r7, 0xC7E72B
  LDI r13, 3472
  LDI r8, 4
  LDI r4, 2335
main_0:
  LDI r14, 256
  LDI r3, 64
  LDI r3, 883
  PSET r14, r3, r3
  IKEY r10
  CMPI r10, 0x5EAE1B
  JNZ r10, key_1
  FRAME
  JMP main_0
