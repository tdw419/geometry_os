; mixed program
; initialization
  LDI r0, 2141
  LDI r5, 0x0B1169
  LDI r3, 128
  LDI r8, 1693
  CMP r13, r8
  JNZ r13, else_0
  SHR r13, r3, r2
  JMP endif_1
else_0:
  LDI r9, 261
  LDI r13, 1278
  LDI r0, 0x098B0F
  LDI r11, 0
  CIRCLE r9, r13, r0, r11
endif_1:
  LDI r14, 255
  LDI r10, 8
  LDI r26, 0x150C3E
  DRAWTEXT r14, r10, r26, "WORLD"
  SHR r6, r7, r13
  LDI r7, 2654
  LDI r5, 2
  LDI r12, 4
  LDI r13, 1514
  LDI r10, 10
  RECTF r7, r5, r12, r13, r10
  SAR r14, r1, r6
  SHLI r6, r15, 0
  LDI r15, 256
loop_2:
  ADD r11, r9, r4
  AND r2, r11, r14
  LDI r12, 1
  SUB r15, r15, r12
  JNZ r15, loop_2
  LDI r5, 0x490282
  STORE r5, r27
  LOAD r1, r5
  LDI r9, 1788
  STORE r9, r30
  LOAD r8, r9
  LDI r6, 0x5C5E3E
  STORE r6, r12
  LOAD r11, r6
  LDI r2, 0x43E8ED
  STORE r2, r12
  LOAD r5, r2
  LDI r1, 148
  STORE r1, r27
  LOAD r3, r1
  CALL func_3
func_3:
  ADD r13, r11, r4
  MOD r2, r6, r8
  AND r10, r3, r14
  MOD r8, r4, r1
  XOR r4, r5, r9
  SHL r0, r30, r6
  RET
  HALT
