; mixed program
; initialization
  LDI r5, 10
  LDI r6, 0x8E74A3
  LDI r11, 1364
  LDI r0, 32
  LDI r3, 0x2CF255
  LDI r24, 960
  LDI r7, 897
; palette
  LDI r13, 0x8063
  LDI r12, 1
  LDI r9, 0xDD0044
  STORE r13, r9
  ADD r13, r13, r12
  LDI r9, 0x550077
  STORE r13, r9
  ADD r13, r13, r12
  LDI r9, 0xFFAA00
  STORE r13, r9
  ADD r13, r13, r12
  LDI r9, 0x0000CC
  STORE r13, r9
  ADD r13, r13, r12
  LDI r0, 1
  LDI r5, 575
  LDI r13, 2159
  DRAWTEXT r0, r5, r13, "WORLD"
  MUL r12, r15, r8
  XOR r4, r3, r14
  ADD r8, r1, r21
  LDI r26, 8
loop_0:
  LDI r7, 32
  LDI r14, 32
  LDI r12, 2744
  PSET r7, r14, r12
  LDI r0, 988
  LDI r6, 32
  LDI r9, 0x194D92
  LDI r12, 0x237BF6
  LDI r6, 16
  LINE r0, r6, r9, r12, r6
  ADD r12, r17, r1
  LDI r31, 1
  SUB r26, r26, r31
  JNZ r26, loop_0
  CALL func_1
func_1:
  DIV r8, r13, r0
  OR r12, r9, r8
  SHL r7, r6, r0
  RET
main_2:
  LDI r3, 0x46826E
  LDI r2, 0xAFFDB1
  LDI r11, 0
  LDI r13, 2198
  LDI r11, 128
  LINE r3, r2, r11, r13, r11
  ANDI r0, r11, 29
  ANDI r13, r10, 1
  CMPI r0, r15, 194
  FRAME
  JMP main_2
