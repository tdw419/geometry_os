; input driven program
; initialization
  LDI r8, 0xF74545
  LDI r13, 2817
  LDI r2, 4
  LDI r4, 1722
  LDI r11, 2405
  LDI r0, 0xF9897D
  LDI r1, 907
main_0:
  IKEY r3
  CMPI r3, 128
  JNZ r3, key_1
  LDI r14, 4
  LDI r20, 1
  LDI r31, 2
  PSETI
  FRAME
  JMP main_0
