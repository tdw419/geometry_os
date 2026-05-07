; mixed program
; initialization
  LDI r15, 533
  LDI r9, 2
  LDI r7, 1105
  LDI r28, 0x817417
  LDI r7, 499
  DRAWTEXT r7, r28, r7, "WORLD"
  OR r14, r4, r2
  IKEY r2
  CMPI r2, 255
  JNZ r2, key_0
  LDI r5, 2
  STORE r5, r4
  LOAD r14, r5
  LDI r5, 32
  STORE r5, r12
  LOAD r8, r5
  LDI r9, 0x2ADA55
  STORE r9, r25
  LOAD r11, r9
  LDI r4, 10
  LDI r3, 2902
  LDI r2, 10
  DRAWTEXT r4, r3, r2, "WORLD"
  HALT
