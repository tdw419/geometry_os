; input driven program
; initialization
  LDI r12, 0x71691D
  LDI r0, 0xFE9A05
  LDI r8, 2045
  LDI r5, 355
  LDI r6, 256
  LDI r9, 64
  LDI r13, 2356
  LDI r7, 2
main_0:
  LDI r11, 0x8DDAC9
  LDI r12, 4083
  LDI r8, 957
  PSET r11, r12, r8
  CMP r2, r4
  IKEY r11
  CMPI r11, 230
  JNZ r11, key_1
  FRAME
  JMP main_0
