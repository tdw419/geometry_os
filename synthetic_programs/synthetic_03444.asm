; input driven program
; initialization
  LDI r0, 0xEAEAC1
  LDI r19, 0x0EB155
  LDI r4, 0x62AE7B
  LDI r14, 0xA96CC3
main_0:
  LDI r2, 1
  LDI r4, 10
  LDI r8, 634
  DRAWTEXT r2, r4, r8, "WORLD"
  IKEY r14
  CMPI r14, 0x8943DA
  JNZ r14, key_1
  LDI r11, 16
  LDI r14, 2167
  LDI r10, 255
  LDI r2, 10
  CIRCLE r11, r14, r10, r2
  FRAME
  JMP main_0
