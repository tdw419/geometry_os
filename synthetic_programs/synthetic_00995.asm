; mixed program
; initialization
  LDI r1, 2961
  LDI r10, 1987
  LDI r12, 10
  LDI r2, 0xC00F2B
  LDI r14, 2654
  LDI r4, 0xB89350
  LDI r29, 3238
  LDI r3, 255
loop_0:
  SUBI r1, r3, 16
  LDI r1, 1
  SUB r3, r3, r1
  JNZ r3, loop_0
  OR r6, r3, r13
  XOR r2, r14, r15
  IKEY r10
  CMPI r10, 10
  JNZ r10, key_1
main_2:
  LDI r13, 1144
  LDI r3, 16
  LDI r15, 16
  TEXT r13, r3, r15, "HELLO"
  LDI r1, 8
  LDI r0, 64
  LDI r14, 0x7769BC
  DRAWTEXT r1, r0, r14, "WORLD"
  ADD r24, r6, r1
  IKEY r15
  CMPI r15, 86
  JNZ r15, key_3
  CMPI r6, 8
  FRAME
  JMP main_2
