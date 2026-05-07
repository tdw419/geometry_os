; mixed program
; initialization
  LDI r13, 3617
  LDI r8, 3147
  LDI r15, 0xFBCADC
  STORE r15, r13
  LOAD r0, r15
  LDI r14, 128
  STORE r14, r7
  LOAD r6, r14
  CMPI r11, 254
  OR r15, r14, r0
  AND r12, r8, r4
  AND r3, r15, r8
  OR r15, r1, r13
  LDI r4, 1
loop_0:
  LDI r13, 200
  LDI r4, 2182
  LDI r5, 465
  LDI r0, 32
  CIRCLE r13, r4, r5, r0
  LDI r2, 1
  SUB r4, r4, r2
  JNZ r4, loop_0
  HALT
