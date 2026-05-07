; mixed program
; initialization
  LDI r10, 1
  LDI r12, 220
  LDI r7, 606
  LDI r6, 10
  LDI r5, 2720
  LDI r9, 2095
  LDI r1, 3618
  LDI r3, 3292
  CMP r13, r5
  JNZ r13, else_0
  OR r25, r5, r0
  AND r6, r2, r1
  JMP endif_1
else_0:
  LDI r5, 1565
  LDI r2, 0
  LDI r1, 4
  PSET r5, r2, r1
  LDI r13, 2933
  LDI r15, 3672
  LDI r15, 793
  PSET r13, r15, r15
endif_1:
  CALL func_2
func_2:
  SUB r14, r15, r0
  OR r12, r6, r7
  OR r8, r5, r0
  OR r1, r15, r5
  ADD r0, r6, r4
  XOR r5, r15, r9
  RET
  LDI r5, 0x2B2EC9
loop_3:
  ADD r0, r3, r5
  DIV r2, r6, r0
  LDI r14, 1
  SUB r5, r5, r14
  JNZ r5, loop_3
  LDI r9, 696
  STORE r9, r7
  LOAD r6, r9
  LDI r3, 0xC05CDA
  STORE r3, r5
  LOAD r2, r3
  LDI r13, 2415
  STORE r13, r1
  LOAD r12, r13
  LDI r11, 2
  STORE r11, r1
  LOAD r10, r11
  LDI r8, 2
  STORE r8, r10
  LOAD r14, r8
  CMP r13, r3
  SHL r11, r7, r26
  SHR r9, r14, r1
  SAR r13, r0, r9
  SHLI r7, r4, 4
  XOR r7, r15, r6
  AND r7, r10, r5
  AND r15, r3, r5
  AND r3, r11, r8
main_4:
  LDI r5, 32
  LDI r7, 255
  LDI r8, 0x1FADC4
  TEXT r5, r7, r8, "HELLO"
  CMPI r27, r14, 0x8549E2
  FRAME
  JMP main_4
