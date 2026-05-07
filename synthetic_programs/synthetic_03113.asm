; mixed program
; initialization
  LDI r6, 4
  LDI r5, 255
  LDI r3, 0x7958AE
  STORE r3, r14
  LOAD r4, r3
  LDI r13, 0x0x70A8811B6
  STORE r13, r9
  LOAD r12, r13
  AND r6, r5, r0
  AND r14, r2, r12
  AND r6, r3, r14
  LDI r3, 32
  LDI r1, 0x75C68F
  LDI r15, 2251
  TEXT r3, r1, r15, "HELLO"
  LDI r4, 8
loop_0:
  SHR r15, r31, r3
  OR r24, r15, r5
  ANDI r10, r7, 0xC6FA54
  LDI r3, 1
  SUB r4, r4, r3
  JNZ r4, loop_0
  SHR r14, r3, r10
  SHR r6, r13, r8
  IKEY r10
  CMPI r10, 218
  JNZ r10, key_1
  LDI r0, 866
  LDI r5, 1379
  LDI r5, 0xFF1A4E
  LDI r13, 336
  CIRCLE r0, r5, r5, r13
  PUSH r11
  PUSH r20
  PUSH r6
  PUSH r0
  OR r19, r2, r3
  MUL r7, r15, r5
  XOR r0, r14, r10
  POP r0
  POP r6
  POP r20
  POP r11
  HALT
