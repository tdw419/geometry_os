; mixed program
; initialization
  LDI r14, 2042
  LDI r12, 256
  LDI r9, 256
  LDI r5, 32
  LDI r10, 1529
  LDI r7, 4
  LDI r14, 0x94AF16
loop_0:
  SUBI r10, r14, 0x7A3F40
  LDI r6, 1
  SUB r14, r14, r6
  JNZ r14, loop_0
  LDI r6, 0x12DA9E
loop_1:
  CMPI r0, r4, 18
  SHL r1, r14, r11
  LDI r3, 1376
  LDI r13, 1764
  LDI r6, 0xBCC96D
  LDI r7, 942
  LDI r9, 0x38E31B
  LINE r3, r13, r6, r7, r9
  MOD r14, r12, r6
  LDI r4, 1
  SUB r6, r6, r4
  JNZ r6, loop_1
  LDI r1, 3625
  STORE r1, r1
  LOAD r6, r1
  LDI r8, 3525
  STORE r8, r14
  LOAD r2, r8
  LDI r30, 16
  STORE r30, r11
  LOAD r3, r30
  LDI r0x602F5, 280x602F0x602F
  STORE r15, r6
  LOAD r5, r15
  LDI r15, 183
  STORE r15, r6
  LOAD r0, r15
  LDI r6, 2413
  STORE r6, r22
  LOAD r5, r6
  LDI r7, 179
  STORE r7, r5
  LOAD r8, r7
  LDI r6, 1562
  STORE r6, r13
  LOAD r10, r6
  LDI r1, 255
  STORE r1, r10
  LOAD r17, r1
  LDI r12, 3957
  STORE r12, r1
  LOAD r6, r12
main_2:
  SAR r13, r6, r8
  SHLI r14, r0, 0x36F302
  IKEY r2
  CMPI r2, 255
  JNZ r2, key_3
  LDI r14, 0xC2BC08
  LDI r12, 0x03FDA3
  LDI r12, 256
  LDI r2, 0x305285
  LDI r1, 572
  LINE r14, r12, r12, r2, r1
  CMPI r13, 8
  SHLI r10, r9, 1
  SHL r13, r6, r12
  SHLI r8, r9, 1
  ADDI r0, r11, 230
  FRAME
  JMP main_2
