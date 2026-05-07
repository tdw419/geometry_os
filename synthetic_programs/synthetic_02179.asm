; input driven program
; initialization
  LDI r2, 255
  LDI r0, 3673
  LDI r13, 0x5FFE3C
  LDI r6, 0xB66C6E
  LDI r3, 0x776DD0
main_0:
  MUL r4, r12, r0
  IKEY r10
  CMPI r10, 0x6C2AD4
  JNZ r10, key_1
  XOR r8, r13, r9
  FRAME
  JMP main_0
