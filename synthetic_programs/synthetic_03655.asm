; mixed program
; initialization
  LDI r1, 0x684E07
  LDI r9, 32
  LDI r4, 0
loop_0:
  ANDI r14, r8, 218
  OR r2, r20, r0
  LDI r1, 1
  SUB r4, r4, r1
  JNZ r4, loop_0
  MOD r3, r0, r12
  PUSH r14
  PUSH r0
  SHR r11, r0, r2
  XOR r7, r2, r3
  POP r0
  POP r14
  IKEY r10
  CMPI r10, 1
  JNZ r10, key_1
  LDI r9, 3509
  LDI r14, 756
  LDI r5, 0x8ABF2D
  TEXT r9, r14, r5, "HELLO"
  PUSH r18
  PUSH r3
  PUSH r7
  PUSH r12
  AND r2, r6, r8
  DIV r8, r15, r4
  POP r12
  POP r7
  POP r3
  POP r18
  XOR r13, r0, r5
  IKEY r2
  CMPI r2, 0x2F7247
  JNZ r2, key_2
  HALT
