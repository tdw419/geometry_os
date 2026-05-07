; mixed program
; initialization
  LDI r1, 2056
  LDI r2, 8
  LDI r12, 255
  LDI r11, 16
  SHR r10, r11, r3
  SAR r13, r19, r0
  SHL r5, r7, r13
  SHLI r6, r15, 6
  OR r15, r9, r3
  OR r9, r0, r31
  LDI r4, 0
  STORE r4, r9
  LOAD r6, r4
  LDI r8, 4
  STORE r8, r14
  LOAD r31, r8
  LDI r8, 3037
  STORE r8, r23
  LOAD r5, r8
  LDI r2, 1
  STORE r2, r13
  LOAD r5, r2
  LDI r7, 0x96D6DE
  STORE r7, r15
  LOAD r10, r7
  CMPI r27, 0x1F01C0
  LDI r9, 32
loop_0:
  LDI r6, 3907
  FILL r6
  ADDI r15, r4, 0
  LDI r27, 1
  SUB r9, r9, r27
  JNZ r9, loop_0
  HALT
