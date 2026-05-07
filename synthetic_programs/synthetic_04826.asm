; drawing loop program
; initialization
  LDI r1, 256
  LDI r7, 1562
  LDI r2, 915
  LDI r8, 1
  LDI r11, 0xC5EEC7
  LDI r6, 1
  LDI r4, 256
  LDI r13, 2
main_0:
  IKEY r8
  CMPI r8, 192
  JNZ r8, key_1
  LDI r12, 2713
  LDI r8, 64
  LDI r5, 1
  TEXT r12, r8, r5, "HELLO"
  LDI r7, 0xB3040A
  LDI r3, 10
  LDI r5, 255
  TEXT r7, r3, r5, "HELLO"
  AND r12, r15, r13
  AND r22, r10, r8
  MOD r14, r7, r1
  IKEY r15
  CMPI r15, 0xBFEB07
  JNZ r15, key_2
  FRAME
  JMP main_0
