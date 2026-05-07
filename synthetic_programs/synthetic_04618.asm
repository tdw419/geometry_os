; mixed program
; initialization
  LDI r21, 0xF66A97
  LDI r12, 128
  LDI r4, 2458
  LDI r14, 2931
  LDI r5, 3348
  LDI r13, 1188
  LDI r26, 0x3A32D4
  LDI r6, 3668
  CIRCLE r5, r13, r26, r6
  PUSH r8
  PUSH r0
  MUL r4, r2, r0
  SUB r5, r2, r9
  SHL r8, r1, r7
  AND r2, r9, r6
  POP r0
  POP r8
  IKEY r3
  CMPI r3, 219
  JNZ r3, key_0
  LDI r14, 1041
  STORE r14, r1
  LOAD r6, r14
  LDI r7, 753
  STORE r7, r0
  LOAD r9, r7
  LDI r5, 505
  STORE r5, r0
  LOAD r14, r5
  LDI r7, 2342
  STORE r7, r4
  LOAD r2, r7
  SHR r13, r3, r25
  SHR r7, r11, r13
  SHL r4, r13, r1
  SHR r23, r4, r1
  MOD r6, r4, r10
  LDI r15, 1
  LDI r4, 256
  LDI r2, 0xB48535
  DRAWTEXT r15, r4, r2, "WORLD"
main_1:
  XOR r6, r13, r10
  XOR r5, r12, r2
  XOR r16, r8, r3
  AND r13, r1, r31
  SAR r3, r9, r8
  SHR r10, r14, r2
  SAR r13, r16, r3
  SHL r5, r15, r2
  FRAME
  JMP main_1
