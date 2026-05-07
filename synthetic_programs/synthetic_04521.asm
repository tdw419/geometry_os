; input driven program
; initialization
  LDI r6, 128
  LDI r1, 24
  LDI r0, 1200
  LDI r15, 0x13D918
  LDI r7, 256
  LDI r2, 0xF42AD7
  LDI r12, 2
  LDI r19, 16
main_0:
  IKEY r9
  CMPI r9, 4
  JNZ r9, key_1
  CMP r10, r2
  FRAME
  JMP main_0
