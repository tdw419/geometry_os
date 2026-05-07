; mixed program
; initialization
  LDI r12, 0xFCF5E1
  LDI r5, 128
  LDI r8, 10
  LDI r6, 255
  LDI r4, 2147
  LDI r13, 0x6C35F3
  LDI r2, 2553
  SAR r6, r2, r5
  SAR r27, r9, r7
  SHL r3, r0, r9
  MUL r15, r13, r4
  LDI r3, 255
loop_0:
  LDI r11, 851
  LDI r5, 3318
  LDI r23, 0x227BB2
  PSETI
  LDI r4, 1
  SUB r3, r3, r4
  JNZ r3, loop_0
  CMPI r11, 256
  CMP r27, r8
  SAR r8, r3, r7
  SAR r3, r4, r12
  LDI r9, 1
  STORE r9, r7
  LOAD r2, r9
  LDI r11, 2330
  STORE r11, r10
  LOAD r6, r11
  LDI r15, 32
  STORE r15, r4
  LOAD r5, r15
  LDI r8, 256
  STORE r8, r6
  LOAD r24, r8
  LDI r1, 4
  STORE r1, r9
  LOAD r4, r1
  MOD r3, r14, r6
main_1:
  CMP r2, r9
  LDI r6, 0x1BB71F
  LDI r4, 2528
  LDI r10, 8
  TEXT r6, r4, r10, "HELLO"
  LDI r11, 1243
  LDI r2, 3207
  LDI r5, 0x712F21
  TEXT r11, r2, r5, "HELLO"
  LDI r9, 0xA76D1C
  LDI r10, 256
  LDI r2, 255
  TEXT r9, r10, r2, "HELLO"
  LDI r4, 4
  LDI r1, 2652
  LDI r12, 2076
  LDI r9, 8
  LDI r4, 2591
  LINE r4, r1, r12, r9, r4
  FRAME
  JMP main_1
