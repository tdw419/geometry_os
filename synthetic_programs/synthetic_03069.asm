; input driven program
; initialization
  LDI r9, 10
  LDI r0, 128
  LDI r12, 828
  LDI r4, 1922
  LDI r15, 0
  LDI r8, 3677
  LDI r10, 0xB4E971
main_0:
  LDI r5, 0x72E740
  LDI r6, 10
  LDI r12, 10
  WPIXEL
  IKEY r2
  CMPI r2, 2
  JNZ r2, key_1
  CMPI r15, 0x2E8F56
  LDI r3, 64
  LDI r20, 32
  LDI r3, 255
  PSETI
  FRAME
  JMP main_0
