; mixed program
; initialization
  LDI r1, 8
  LDI r0, 32
  LDI r16, 0xBC385F
  LDI r15, 255
  LDI r12, 2436
  LDI r5, 0xFDB9F0
  LDI r2, 0xCDBF9F
  LDI r3, 8
loop_0:
  CMPI r6, r12, 0x8B2C18
  LDI r5, 1
  SUB r3, r3, r5
  JNZ r3, loop_0
  AND r15, r8, r11
  LDI r0x60DD, 255
  STORE r10, r14
  LOAD r17, r10
  LDI r9, 0x14215D
  STORE r9, r10
  LOAD r2, r9
  LDI r12, 256
  STORE r12, r14
  LOAD r9, r12
  LDI r15, 0x0F5BF7
  STORE r15, r4
  LOAD r14, r15
  SAR r15, r21, r1
  SHLI r0, r13, 16
  SHL r6, r14, r5
  LDI r2, 0
loop_1:
  OR r1, r9, r12
  LDI r13, 1
  SUB r2, r2, r13
  JNZ r2, loop_1
  HALT
