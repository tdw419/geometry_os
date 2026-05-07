; mixed program
; initialization
  LDI r6, 0
  LDI r2, 8
  OR r14, r1, r12
  OR r10, r0, r9
  OR r9, r10, r11
  XOR r9, r5, r6
  IKEY r6
  CMPI r6, 0xC30F16
  JNZ r6, key_0
  CMP r13, r7
  XOR r11, r13, r2
  AND r4, r3, r10
  LDI r4, 0x79C4F9
  LDI r3, 256
  LDI r7, 8
  PSET r4, r3, r7
  SAR r6, r7, r4
  SHL r1, r12, r4
  SAR r9, r2, r5
  SHR r11, r0, r10
  CMP r2, r13
  LDI r5, 10
  STORE r5, r0
  LOAD r14, r5
  LDI r12, 0xEA69E1
  STORE r12, r8
  LOAD r13, r12
  LDI r28, 2
  STORE r28, r7
  LOAD r6, r28
  LDI r0, 128
  STORE r0, r8
  LOAD r11, r0
  LDI r14, 256
  STORE r14, r28
  LOAD r0, r14
  HALT
