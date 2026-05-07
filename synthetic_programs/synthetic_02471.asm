; drawing loop program
; initialization
  LDI r5, 1103
  LDI r1, 171
  LDI r0, 0xD6D775
  LDI r2, 3473
  LDI r3, 0x596F88
  LDI r8, 2137
  LDI r9, 1823
main_0:
  SHL r13, r5, r0
  SHR r6, r1, r3
  SHR r20, r4, r8
  SHR r22, r6, r7
  CMPI r4, 181
  IKEY r8
  CMPI r8, 4
  JNZ r8, key_1
  AND r2, r19, r0
  OR r11, r0, r14
  OR r4, r0, r13
  IKEY r0
  CMPI r0, 4
  JNZ r0, key_2
  ADD r5, r11, r14
  FRAME
  JMP main_0
