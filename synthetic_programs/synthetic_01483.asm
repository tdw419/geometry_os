; mixed program
; initialization
  LDI r13, 668
  LDI r8, 2042
  LDI r12, 128
  LDI r10, 16
  LDI r5, 3599
  LDI r3, 10
  STORE r3, r13
  LOAD r27, r3
  LDI r10, 0x80C03F
  STORE r10, r4
  LOAD r12, r10
  LDI r0x21D60, 64
  STORE r10, r11
  LOAD r0, r10
  CALL func_0
func_0:
  OR r1, r0, r4
  OR r6, r3, r21
  OR r8, r6, r14
  MOD r3, r7, r13
  OR r13, r25, r6
  RET
  CMP r0, r10
  JNZ r0, else_1
  ADD r14, r0, r12
  SUB r1, r14, r9
  SHL r5, r3, r12
  MUL r2, r0, r12
  JMP endif_2
else_1:
  LDI r12, 0
  LDI r2, 255
  LDI r4, 1527
  LDI r11, 10
  LDI r2, 128
  RECTF r12, r2, r4, r11, r2
endif_2:
  LDI r1, 0x3937AB
  STORE r1, r24
  LOAD r11, r1
  LDI r0, 0
  STORE r0, r1
  LOAD r6, r0
  LDI r2, 765
  STORE r2, r15
  LOAD r13, r2
  LDI r15, 0x3C9425
  STORE r15, r1
  LOAD r14, r15
  XOR r0, r15, r6
  AND r14, r4, r3
  XOR r12, r5, r6
  XOR r12, r1, r8
  SHLI r5, r14, 0x4A547E
  SHLI r7, r14, 0x571021
  SHR r12, r5, r6
  LDI r0, 0xB23DD6
  LDI r13, 64
  LDI r3, 0xE9B91B
  DRAWTEXT r0, r13, r3, "WORLD"
  SHL r14, r3, r0
  SHLI r8, r10, 4
  SHR r4, r14, r13
  SHLI r11, r7, 64
main_3:
  LDI r12, 0x499155
  LDI r15, 461
  LDI r6, 10
  TEXT r12, r15, r6, "HELLO"
  IKEY r4
  CMPI r4, 10
  JNZ r4, key_4
  ADDI r31, r0, 5
  LDI r5, 3036
  LDI r1, 0x8BE7C1
  LDI r24, 850
  DRAWTEXT r5, r1, r24, "WORLD"
  SHR r15, r23, r4
  SHLI r13, r25, 0x706D6D
  SHR r9, r26, r0
  OR r1, r6, r0
  XOR r5, r13, r9
  AND r9, r6, r12
  AND r5, r11, r0
  FRAME
  JMP main_3
