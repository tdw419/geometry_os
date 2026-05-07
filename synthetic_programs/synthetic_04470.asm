; drawing loop program
; initialization
  LDI r9, 284
  LDI r11, 2518
  LDI r1, 256
  LDI r8, 0
  LDI r14, 64
  LDI r15, 3687
  LDI r2, 4
main_0:
  OR r8, r0, r12
  AND r0, r5, r7
  AND r14, r1, r0
  AND r13, r8, r7
  SHLI r14, r27, 0xF69C95
  SHLI r0, r20, 0x227359
  SHR r4, r7, r2
  CMPI r9, 0xFBDF78
  IKEY r5
  CMPI r5, 121
  JNZ r5, key_1
  FRAME
  JMP main_0
