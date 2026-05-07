; mixed program
; initialization
  LDI r11, 8
  LDI r3, 530
  LDI r12, 2685
  LDI r7, 2848
  LDI r2, 0x428FFF
loop_0:
  CMPI r12, r14, 103
  ADD r11, r30, r1
  CMPI r15, r10, 58
  LDI r5, 1
  SUB r2, r2, r5
  JNZ r2, loop_0
  PUSH r11
  SHL r17, r12, r10
  MOD r2, r4, r1
  OR r0, r1, r14
  MUL r2, r4, r5
  POP r11
  CMP r7, r11
  LDI r14, 2320
  LDI r26, 0x00617C
  LDI r12, 4044
  LDI r1, 2
  CIRCLE r14, r26, r12, r1
  LDI r13, 0xB79BA1
  LDI r4, 128
  LDI r19, 0x104FA6
  LDI r15, 4
  LDI r1, 3277
  RECTF r13, r4, r19, r15, r1
  SHL r7, r11, r10
  SHLI r12, r11, 16
  SAR r13, r4, r5
  SHLI r21, r13, 7
  LDI r4, 10
  STORE r4, r12
  LOAD r1, r4
  LDI r4, 0xE019D3
  STORE r4, r13
  LOAD r5, r4
  LDI r0, 402
  STORE r0, r12
  LOAD r3, r0
  LDI r12, 11
  STORE r12, r1
  LOAD r9, r12
main_1:
  CMPI r13, r10, 0x8876A3
  LDI r0, 0x47894C
  LDI r15, 2651
  LDI r6, 0xBF2859
  TEXT r0, r15, r6, "HELLO"
  LDI r1, 2426
  LDI r0, 1618
  LDI r12, 796
  LDI r11, 0x78739D
  LDI r11, 3632
  LINE r1, r0, r12, r11, r11
  XOR r7, r14, r10
  AND r0, r1, r8
  OR r2, r1, r10
  XOR r1, r11, r9
  CMPI r8, 128
  IKEY r2
  CMPI r2, 130
  JNZ r2, key_2
  FRAME
  JMP main_1
