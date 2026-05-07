; mixed program
; initialization
  LDI r14, 4
  LDI r5, 64
  CMPI r3, 228
  LDI r1, 4
loop_0:
  LDI r30, 32
  LDI r4, 0x34D750
  LDI r0, 2758
  PSETI
  SUBI r6, r13, 103
  LDI r0, 1
  SUB r1, r1, r0
  JNZ r1, loop_0
  PUSH r2
  SHL r1, r3, r0
  ADD r14, r12, r6
  ADD r1, r7, r15
  POP r2
  LDI r4, 255
  STORE r4, r4
  LOAD r6, r4
  LDI r7, 0x1E0414
  STORE r7, r10
  LOAD r12, r7
  LDI r4, 0xDD7A14
  STORE r4, r0
  LOAD r13, r4
  LDI r15, 0xEE5DC0
  STORE r15, r7
  LOAD r10, r15
  CMPI r11, 1
  LDI r0, 3105
  STORE r0, r13
  LOAD r6, r0
  LDI r6, 0xE19A74
  STORE r6, r7
  LOAD r3, r6
  LDI r11, 0xEEFB59
  STORE r11, r25
  LOAD r6, r11
  LDI r15, 0x7CC3E4
  STORE r15, r15
  LOAD r1, r15
  CALL func_1
func_1:
  SHR r14, r3, r9
  DIV r0, r6, r3
  RET
  IKEY r12
  CMPI r12, 0x5A610F
  JNZ r12, key_2
main_3:
  XOR r10, r7, r2
  OR r3, r10, r9
  AND r6, r3, r5
  LDI r0, 0x920B33
  LDI r13, 256
  LDI r1, 128
  LDI r1, 0x9293D4
  CIRCLE r0, r13, r1, r1
  DIV r8, r7, r14
  ANDI r15, r9, 205
  FRAME
  JMP main_3
