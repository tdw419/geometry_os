; mixed program
; initialization
  LDI r2, 0xB8F0AB
  LDI r12, 4
  LDI r3, 0x81C0F2
  IKEY r13
  CMPI r13, 55
  JNZ r13, key_0
  CALL func_1
func_1:
  SHL r6, r9, r2
  ADD r3, r13, r9
  SHL r10, r8, r9
  ADD r10, r8, r13
  SUB r4, r15, r11
  ADD r9, r11, r6
  RET
  LDI r5, 256
  STORE r5, r2
  LOAD r12, r5
  LDI r7, 2555
  STORE r7, r4
  LOAD r9, r7
  IKEY r1
  CMPI r1, 142
  JNZ r1, key_2
  IKEY r11
  CMPI r11, 183
  JNZ r11, key_3
  CALL func_4
func_4:
  DIV r1, r3, r14
  AND r11, r7, r14
  DIV r0, r11, r8
  SHR r1, r0, r2
  SUB r16, r7, r3
  MUL r9, r2, r26
  RET
  LDI r5, 39
loop_5:
  LDI r3, 0x81524C
  LDI r4, 3204
  LDI r8, 32
  LDI r3, 2
  LDI r15, 0x842527
  RECTF r3, r4, r8, r3, r15
  LDI r2, 0x521751
  LDI r0, 0x326B9E
  LDI r15, 0xB9F26A
  LDI r12, 10
  CIRCLE r2, r0, r15, r12
  ANDI r5, r12, 0xCBBD27
  LDI r2, 1
  SUB r5, r5, r2
  JNZ r5, loop_5
  IKEY r15
  CMPI r15, 0x3408A7
  JNZ r15, key_6
main_7:
  LDI r8, 2338
  LDI r11, 73
  LDI r13, 1717
  DRAWTEXT r8, r11, r13, "WORLD"
  SHL r0, r9, r5
  SHL r6, r11, r9
  SHL r0, r2, r12
  XOR r3, r5, r10
  SHR r16, r8, r10
  SHLI r13, r5, 0
  SHR r5, r11, r8
  SHL r10, r6, r11
  SHR r5, r21, r9
  MUL r3, r0, r4
  FRAME
  JMP main_7
