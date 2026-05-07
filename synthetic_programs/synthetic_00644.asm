; mixed program
; initialization
  LDI r3, 3674
  LDI r8, 2382
  LDI r12, 0x7B4A5E
  AND r2, r3, r0
  XOR r1, r15, r6
  OR r11, r12, r7
  DIV r13, r3, r7
  CMPI r1, 71
  SHR r22, r8, r3
  SHL r5, r11, r3
  SHLI r8, r9, 0x38736E
  SHL r3, r7, r11
  CMPI r8, 0x23CCF9
  LDI r9, 1722
  LDI r0, 2906
  LDI r8, 2724
  DRAWTEXT r9, r0, r8, "WORLD"
  IKEY r10
  CMPI r10, 135
  JNZ r10, key_0
  LDI r12, 256
  STORE r12, r13
  LOAD r9, r12
  LDI r7, 2752
  STORE r7, r1
  LOAD r28, r7
  LDI r7, 0xD1103D
  STORE r7, r14
  LOAD r12, r7
  HALT
