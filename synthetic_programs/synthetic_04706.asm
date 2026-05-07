; input driven program
; initialization
  LDI r0, 141
  LDI r5, 0xAF45C0
  LDI r11, 1599
  LDI r9, 2321
  LDI r8, 0xBA2A3A
  LDI r4, 255
main_0:
  SHL r14, r8, r10
  SAR r15, r6, r10
  SAR r10, r7, r15
  LDI r10, 3585
  LDI r12, 1789
  LDI r11, 0xCDB392
  DRAWTEXT r10, r12, r11, "WORLD"
  XOR r6, r4, r0
  XOR r2, r1, r13
  AND r9, r1, r13
  IKEY r15
  CMPI r15, 0xB9596F
  JNZ r15, key_1
  LDI r6, 0
  LDI r1, 616
  LDI r29, 0xD91A39
  TEXT r6, r1, r29, "HELLO"
  FRAME
  JMP main_0
