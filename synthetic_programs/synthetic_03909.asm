; input driven program
; initialization
  LDI r19, 3428
  LDI r7, 1986
  LDI r0, 0x7F48AE
main_0:
  LDI r15, 256
  LDI r1, 0xE7D664
  LDI r11, 1
  DRAWTEXT r15, r1, r11, "WORLD"
  SHR r5, r6, r7
  SHR r8, r9, r7
  SHLI r9, r13, 0x5FB98D
  SHLI r11, r2, 0x0A3893
  AND r2, r10, r8
  OR r0, r6, r15
  AND r0, r12, r14
  ADD r10, r1, r0
  IKEY r1
  CMPI r1, 4
  JNZ r1, key_1
  FRAME
  JMP main_0
