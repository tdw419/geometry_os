; mixed program
; initialization
  LDI r0, 0
  LDI r4, 0x578E55
  LDI r7, 675
  LDI r3, 0x9AE9F6
  PUSH r13
  SHL r0, r12, r5
  XOR r12, r5, r13
  DIV r13, r29, r2
  POP r13
  CMP r0, r11
  JNZ r0, else_0
  SHL r21, r9, r1
  JMP endif_1
else_0:
  LDI r6, 8
  LDI r15, 128
  LDI r0, 4042
  PSETI
endif_1:
  LDI r8, 1475
  STORE r8, r3
  LOAD r15, r8
  LDI r8, 1193
  STORE r8, r1
  LOAD r5, r8
  LDI r7, 1624
  STORE r7, r6
  LOAD r10, r7
  LDI r13, 0x192BE0
  STORE r13, r31
  LOAD r15, r13
  LDI r12, 10
  STORE r12, r3
  LOAD r4, r12
  LDI r6, 0x4BE3B5
  STORE r6, r2
  LOAD r5, r6
  LDI r14, 0
  STORE r14, r9
  LOAD r4, r14
  LDI r13, 1472
  STORE r13, r4
  LOAD r9, r13
  LDI r6, 0x4E2941
  STORE r6, r7
  LOAD r11, r6
  XOR r5, r8, r0
  AND r6, r12, r9
  CALL func_2
func_2:
  ADD r12, r5, r8
  DIV r7, r5, r15
  RET
main_3:
  LDI r23, 64
  LDI r0, 0xD3883D
  LDI r13, 0
  LDI r12, 0x13C50C
  LDI r2, 8
  RECTF r23, r0, r13, r12, r2
  SHR r4, r14, r10
  SAR r4, r2, r1
  SHLI r5, r15, 0x7B334E
  LDI r7, 0x821D04
  LDI r1, 128
  LDI r11, 0x800688
  DRAWTEXT r7, r1, r11, "WORLD"
  CMPI r0, r1, 33
  LDI r14, 0x016CF5
  LDI r9, 64
  LDI r13, 988
  PSET r14, r9, r13
  FRAME
  JMP main_3
