; mixed program
; initialization
  LDI r13, 308
  LDI r12, 3721
  XOR r7, r6, r0
  XOR r10, r14, r5
  OR r11, r9, r6
  LDI r14, 10
  FILL r14
  LDI r11, 8
  LDI r14, 1039
  LDI r14, 1031
  DRAWTEXT r11, r14, r14, "WORLD"
  SHLI r15, r5, 2
  SHLI r2, r4, 0x3BB68C
  IKEY r2
  CMPI r2, 174
  JNZ r2, key_0
  LDI r10, 255
  STORE r10, r8
  LOAD r4, r10
  LDI r1, 2199
  STORE r1, r6
  LOAD r13, r1
  LDI r0, 128
  STORE r0, r4
  LOAD r5, r0
  LDI r1, 3736
  STORE r1, r3
  LOAD r14, r1
  LDI r7, 255
  STORE r7, r27
  LOAD r14, r7
main_1:
  LDI r11, 128
  LDI r7, 4012
  LDI r10, 0xE317E8
  LDI r6, 324
  LDI r14, 64
  RECTF r11, r7, r10, r6, r14
  ADD r1, r6, r0
  LDI r7, 255
  LDI r15, 256
  LDI r5, 0x455E35
  DRAWTEXT r7, r15, r5, "WORLD"
  CMPI r22, 154
  FRAME
  JMP main_1
