; input driven program
; initialization
  LDI r13, 900
  LDI r5, 2
  LDI r9, 0xD457ED
  LDI r8, 2230
  LDI r15, 8
  LDI r2, 408
  LDI r12, 0x83CEAB
  LDI r11, 3433
main_0:
  ADD r15, r2, r5
  IKEY r9
  CMPI r9, 64
  JNZ r9, key_1
  MUL r15, r30, r12
  LDI r8, 2045
  LDI r10, 256
  LDI r8, 4
  DRAWTEXT r8, r10, r8, "WORLD"
  LDI r8, 256
  LDI r0, 10
  LDI r28, 128
  PSETI
  FRAME
  JMP main_0
