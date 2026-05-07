; mixed program
; initialization
  LDI r3, 312
  LDI r12, 0x64BE89
  LDI r18, 3447
  LDI r15, 0x3D8DCF
  LDI r3, 3255
  LDI r8, 1
  TEXT r15, r3, r8, "HELLO"
  LDI r0, 2
loop_0:
  ADDI r8, r12, 0x2B4BA1
  ANDI r4, r6, 4
  CMPI r13, r3, 0x61B42A
  LDI r12, 1
  SUB r0, r0, r12
  JNZ r0, loop_0
  LDI r4, 3225
  STORE r4, r5
  LOAD r7, r4
  LDI r3, 2765
  STORE r3, r2
  LOAD r14, r3
  LDI r9, 0x21A528
  STORE r9, r2
  LOAD r7, r9
  LDI r9, 0x920F27
  STORE r9, r11
  LOAD r2, r9
  LDI r7, 966
  STORE r7, r0
  LOAD r11, r7
  LDI r9, 256
  STORE r9, r2
  LOAD r10, r9
  LDI r5, 10
  STORE r5, r11
  LOAD r14, r5
  LDI r14, 4
  STORE r14, r13
  LOAD r12, r14
  LDI r3, 0xC6FEFD
  LDI r8, 0x44DA27
  LDI r8, 0x612146
  TEXT r3, r8, r8, "HELLO"
  OR r9, r5, r6
  AND r3, r8, r15
  PUSH r6
  OR r0, r1, r9
  OR r8, r11, r13
  MOD r5, r8, r10
  XOR r7, r15, r1
  AND r10, r6, r15
  POP r6
main_1:
  SUBI r7, r5, 185
  LDI r7, 0
  LDI r1, 1
  LDI r9, 0xCD6882
  WPIXEL
  FRAME
  JMP main_1
