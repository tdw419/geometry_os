; mixed program
; initialization
  LDI r10, 3692
  LDI r14, 2239
  LDI r6, 676
  LDI r1, 128
  LDI r5, 0x59A84D
  LDI r13, 3108
  LDI r15, 1040
  LDI r7, 0x9109D4
  LDI r10, 255
  STORE r10, r11
  LOAD r0, r10
  LDI r0, 10
  STORE r0, r4
  LOAD r8, r0
  LDI r9, 3046
  STORE r9, r9
  LOAD r14, r9
  LDI r11, 2566
  STORE r11, r6
  LOAD r8, r11
  LDI r0, 68
  STORE r0, r0
  LOAD r2, r0
  PUSH r12
  PUSH r2
  SUB r6, r13, r1
  SHL r0, r3, r8
  POP r2
  POP r12
  LDI r9, 128
  LDI r3, 1668
  LDI r11, 3005
  DRAWTEXT r9, r3, r11, "WORLD"
  PUSH r3
  PUSH r14
  PUSH r2
  OR r8, r11, r9
  XOR r9, r7, r4
  POP r2
  POP r14
  POP r3
main_0:
  LDI r2, 255
  LDI r3, 2538
  LDI r13, 32
  TEXT r2, r3, r13, "HELLO"
  IKEY r7
  CMPI r7, 32
  JNZ r7, key_1
  FRAME
  JMP main_0
