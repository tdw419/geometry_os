; input driven program
; initialization
  LDI r11, 2
  LDI r8, 1
  LDI r4, 1068
  LDI r10, 2079
main_0:
  SHR r2, r9, r12
  IKEY r12
  CMPI r12, 208
  JNZ r12, key_1
  LDI r9, 0x5ACDE3
  LDI r10, 256
  LDI r14, 255
  DRAWTEXT r9, r10, r14, "WORLD"
  FRAME
  JMP main_0
