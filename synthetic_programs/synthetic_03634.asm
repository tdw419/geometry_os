; mixed program
; initialization
  LDI r3, 2768
  LDI r2, 4
  LDI r13, 1402
  LDI r1, 32
  IKEY r12
  CMPI r12, 0xD999EF
  JNZ r12, key_0
  AND r6, r3, r14
  OR r0, r2, r4
  XOR r15, r0, r5
  OR r22, r5, r11
  XOR r7, r13, r11
  CMPI r2, 161
  XOR r14, r3, r6
  AND r14, r5, r1
  AND r11, r15, r13
  OR r3, r8, r9
  AND r0, r3, r11
  LDI r2, 0x536587
  LDI r10, 4
  LDI r12, 0x06B64E
  LDI r19, 714
  LDI r10, 0xBDE8B7
  RECTF r2, r10, r12, r19, r10
  SHLI r0, r14, 0x66F0EA
  SHL r11, r3, r8
  HALT
