; mixed program
; initialization
  LDI r13, 3668
  LDI r2, 3427
  LDI r14, 16
  LDI r3, 1601
  LDI r4, 4
  LDI r0, 4
  LDI r14, 837
  LDI r3, 1030
  LDI r7, 1118
  RECTF r4, r0, r14, r3, r7
  XOR r5, r2, r1
  XOR r7, r13, r11
  AND r13, r5, r3
  AND r3, r8, r7
  IKEY r2
  CMPI r2, 16
  JNZ r2, key_0
  PUSH r9
  PUSH r4
  DIV r3, r0, r14
  MOD r12, r14, r0
  SUB r6, r3, r10
  POP r4
  POP r9
  CMP r0, r6
  HALT
