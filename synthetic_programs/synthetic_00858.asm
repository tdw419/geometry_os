; mixed program
; initialization
  LDI r2, 0
  LDI r15, 3542
  LDI r7, 3831
  LDI r9, 2672
  LDI r11, 0xBCBBD5
  LDI r3, 255
  LDI r13, 3300
  LDI r5, 32
; palette
  LDI r4, 0x2031
  LDI r6, 1
  LDI r12, 0x000000
  STORE r4, r12
  ADD r4, r4, r6
  LDI r12, 0x00FF44
  STORE r4, r12
  ADD r4, r4, r6
  LDI r12, 0xFF4400
  STORE r4, r12
  ADD r4, r4, r6
  LDI r12, 0xFFAA00
  STORE r4, r12
  ADD r4, r4, r6
  LDI r12, 0x444444
  STORE r4, r12
  ADD r4, r4, r6
  LDI r12, 0x8800FF
  STORE r4, r12
  ADD r4, r4, r6
  LDI r12, 0x880088
  STORE r4, r12
  ADD r4, r4, r6
  LDI r15, 0x4815E0
  LDI r8, 4
  LDI r12, 3669
  DRAWTEXT r15, r8, r12, "WORLD"
  LDI r1, 3865
  LDI r11, 0x61987C
  LDI r8, 1741
  LDI r10, 0x6EF192
  LDI r5, 0x3B32C6
  LINE r1, r11, r8, r10, r5
  IKEY r2
  CMPI r2, 69
  JNZ r2, key_0
  LDI r2, 335
  STORE r2, r7
  LOAD r11, r2
  LDI r10, 0x968BFE
  STORE r10, r3
  LOAD r2, r10
  LDI r8, 1629
  STORE r8, r7
  LOAD r9, r8
  LDI r2, 0x185380
  STORE r2, r10
  LOAD r4, r2
  OR r6, r12, r10
  OR r1, r12, r3
  XOR r14, r11, r5
  LDI r1, 128
loop_1:
  SHL r2, r11, r15
  LDI r5, 1
  SUB r1, r1, r5
  JNZ r1, loop_1
main_2:
  MOD r13, r6, r12
  IKEY r9
  CMPI r9, 4
  JNZ r9, key_3
  AND r0, r12, r3
  AND r3, r15, r9
  AND r12, r6, r4
  XOR r12, r5, r14
  XOR r13, r2, r11
  XOR r1, r14, r6
  LDI r6, 256
  LDI r9, 3555
  LDI r6, 392
  DRAWTEXT r6, r9, r6, "WORLD"
  SAR r12, r8, r5
  SHR r11, r7, r1
  SHLI r4, r7, 10
  SAR r7, r13, r6
  FRAME
  JMP main_2
