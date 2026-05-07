; mixed program
; initialization
  LDI r13, 4083
  LDI r5, 8
  LDI r8, 1
  LDI r13, 2619
  STORE r13, r7
  LOAD r29, r13
  LDI r12, 211
  STORE r12, r9
  LOAD r13, r12
  LDI r7, 0x208735
  STORE r7, r6
  LOAD r14, r7
  LDI r2, 8
  STORE r2, r12
  LOAD r4, r2
  LDI r5, 0xF2D926
loop_0:
  LDI r6, 0x38BF6D
  LDI r0, 0x0A59A9
  LDI r9, 0x6E140F
  LDI r1, 0xC4C6C0
  CIRCLE r6, r0, r9, r1
  LDI r15, 1
  SUB r5, r5, r15
  JNZ r5, loop_0
  LDI r4, 0
loop_1:
  SUBI r3, r8, 21
  SHR r8, r13, r2
  LDI r5, 0xD5FCC7
  FILL r5
  LDI r0, 1
  SUB r4, r4, r0
  JNZ r4, loop_1
main_2:
  SHLI r7, r3, 0xE65CCE
  SHLI r3, r5, 128
  SHLI r26, r4, 8
  SUBI r6, r10, 10
  OR r8, r9, r7
  AND r14, r2, r6
  AND r15, r12, r11
  CMPI r7, r9, 0x70E095
  FRAME
  JMP main_2
