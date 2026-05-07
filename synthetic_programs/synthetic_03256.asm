; drawing loop program
; initialization
  LDI r3, 0x107D32
  LDI r6, 255
  LDI r4, 2611
  LDI r1, 2800
  LDI r10, 0x1B906D
  LDI r13, 128
  LDI r8, 1978
main_0:
  IKEY r10
  CMPI r10, 23
  JNZ r10, key_1
  SHL r10, r6, r12
  FRAME
  JMP main_0
