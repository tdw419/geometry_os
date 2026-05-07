; input driven program
; initialization
  LDI r10, 32
  LDI r3, 16
  LDI r6, 270
  LDI r12, 0
  LDI r8, 39
  LDI r14, 2243
main_0:
  SHR r4, r3, r14
  SHR r7, r8, r10
  CMPI r11, 0x3C89A2
  FRAME
  JMP main_0
