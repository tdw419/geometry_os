; input driven program
; initialization
  LDI r12, 256
  LDI r9, 3940
  LDI r14, 788
  LDI r6, 0
  LDI r30, 3423
  LDI r11, 256
  LDI r27, 674
  LDI r8, 0xB0215C
main_0:
  IKEY r11
  CMPI r11, 188
  JNZ r11, key_1
  LDI r15, 0x0DDD36
  LDI r11, 1989
  LDI r15, 4
  PSETI
  SHL r10, r14, r17
  ADD r5, r6, r0
  LDI r7, 3374
  LDI r6, 0x198180
  LDI r4, 10
  DRAWTEXT r7, r6, r4, "WORLD"
  FRAME
  JMP main_0
