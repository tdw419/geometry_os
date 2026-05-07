; input driven program
; initialization
  LDI r15, 32
  LDI r2, 159
  LDI r6, 0xB781A4
  LDI r14, 32
  LDI r7, 0xAC4F5D
  LDI r24, 0xDF1B5A
  LDI r10, 255
main_0:
  CMPI r2, r8, 192
  IKEY r10
  CMPI r10, 0x32D68D
  JNZ r10, key_1
  FRAME
  JMP main_0
