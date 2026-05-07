; mixed program
; initialization
  LDI r3, 0xFFBDE4
  LDI r25, 3678
  LDI r7, 2155
  LDI r4, 4
  LDI r11, 530
  OR r7, r1, r2
  XOR r1, r0, r10
  XOR r6, r11, r16
  LDI r7, 1596
  LDI r15, 3597
  LDI r1, 0xBB1AEC
  DRAWTEXT r7, r15, r1, "WORLD"
  LDI r3, 3012
  LDI r25, 4000
  LDI r9, 8
  DRAWTEXT r3, r25, r9, "WORLD"
  IKEY r3
  CMPI r3, 0x9ED5C0
  JNZ r3, key_0
  SHR r4, r15, r12
  SHLI r0, r5, 256
  SHL r12, r11, r21
  SHLI r3, r8, 4
  PUSH r6
  PUSH r2
  ADD r14, r7, r2
  SUB r9, r10, r4
  DIV r12, r0, r10
  POP r2
  POP r6
  LDI r6, 2
loop_1:
  ADDI r13, r0, 128
  LDI r14, 1
  SUB r6, r6, r14
  JNZ r6, loop_1
  IKEY r8
  CMPI r8, 0
  JNZ r8, key_2
main_3:
  CMPI r13, r15, 0xA2BA46
  LDI r11, 3574
  LDI r6, 2327
  LDI r29, 2196
  WPIXEL
  CMP r20, r1
  LDI r0, 10
  LDI r1, 0x55F448
  LDI r13, 0x0E559B
  TEXT r0, r1, r13, "HELLO"
  LDI r3, 0xCA4677
  LDI r4, 0x867314
  LDI r14, 0x3CE261
  DRAWTEXT r3, r4, r14, "WORLD"
  FRAME
  JMP main_3
