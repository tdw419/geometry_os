; mixed program
; initialization
  LDI r8, 32
  LDI r9, 0x754332
  LDI r14, 4
  LDI r0, 0x3D347F
  LDI r12, 8
  LDI r15, 32
  LDI r10, 128
  LDI r3, 4
; palette
  LDI r15, 0x20FB
  LDI r13, 1
  LDI r2, 0x0000CC
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0xFFFFFF
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0x00FF44
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0x00AAFF
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0xFF4400
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0x0000CC
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0xDD0044
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0xAA00AA
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0x0000FF
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0xFF00FF
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0x00FF44
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0xFF8800
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0x00FFFF
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0xFFFFFF
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0xFFFFFF
  STORE r15, r2
  ADD r15, r15, r13
  LDI r2, 0xAA00AA
  STORE r15, r2
  ADD r15, r15, r13
  OR r3, r1, r10
  OR r9, r11, r20
  OR r15, r3, r9
  XOR r2, r5, r1
  LDI r9, 64
  STORE r9, r8
  LOAD r0, r9
  LDI r7, 0x380x6054FEF
  STORE r7, r4
  LOAD r6, r7
  LDI r14, 0x9F6614
  STORE r14, r3
  LOAD r9, r14
  LDI r7, 3593
  STORE r7, r11
  LOAD r14, r7
  LDI r10, 0
  STORE r10, r7
  LOAD r0, r10
  CMP r1, r2
  JNZ r1, else_0
  OR r14, r0, r2
  MUL r12, r15, r27
  ADD r3, r1, r0
  JMP endif_1
else_0:
  LDI r13, 0x15E2CB
  LDI r15, 3512
  LDI r8, 0
  LDI r0, 128
  CIRCLE r13, r15, r8, r0
  LDI r4, 128
  LDI r8, 1457
  LDI r15, 0x7CEE56
  LDI r14, 0x04D2A8
  LDI r30, 709
  RECTF r4, r8, r15, r14, r30
  LDI r9, 1811
  LDI r3, 0xB6980E
  LDI r1, 1825
  PSET r9, r3, r1
  LDI r10, 1
  LDI r14, 0x1F85E6
  LDI r11, 1011
  LDI r5, 2
  LDI r5, 255
  LINE r10, r14, r11, r5, r5
endif_1:
  LDI r9, 10
  LDI r0, 0x3187FE
  LDI r3, 2025
  TEXT r9, r0, r3, "HELLO"
  LDI r4, 1337
  LDI r5, 2596
  LDI r3, 1535
  LDI r3, 255
  LDI r7, 16
  RECTF r4, r5, r3, r3, r7
  CMPI r8, 178
  XOR r12, r14, r1
  AND r12, r0, r1
  XOR r7, r3, r14
  XOR r11, r2, r6
  OR r11, r10, r15
  OR r9, r2, r11
main_2:
  CMPI r22, r11, 227
  ADDI r7, r1, 0x1DB7C7
  LDI r10, 10
  LDI r14, 128
  LDI r1, 0x8922D5
  PSET r10, r14, r1
  ADDI r6, r10, 0xE9EAF2
  OR r7, r14, r9
  OR r2, r1, r6
  FRAME
  JMP main_2
