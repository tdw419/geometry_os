; mixed program
; initialization
  LDI r11, 2
  LDI r3, 255
  LDI r2, 3784
  LDI r12, 2412
  SAR r0, r10, r14
  SHL r23, r8, r6
  IKEY r15
  CMPI r15, 108
  JNZ r15, key_0
  PUSH r2
  PUSH r15
  PUSH r12
  PUSH r10
  OR r2, r13, r5
  SUB r14, r1, r0
  POP r10
  POP r12
  POP r15
  POP r2
  LDI r4, 10x229A
  STORE r4, r11
  LOAD r14, r4
  LDI r0x23110, 770
  STORE r10, r7
  LOAD r6, r10
  LDI r7, 893
  STORE r7, r5
  LOAD r11, r7
  HALT
