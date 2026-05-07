; drawing loop program
; initialization
  LDI r23, 1706
  LDI r18, 256
  LDI r1, 3081
  LDI r13, 16
  LDI r4, 10
main_0:
  AND r15, r2, r5
  XOR r9, r8, r15
  AND r13, r9, r5
  AND r0, r11, r9
  CMP r14, r9
  SUB r5, r3, r12
  OR r3, r12, r9
  XOR r13, r1, r2
  IKEY r25
  CMPI r25, 73
  JNZ r25, key_1
  FRAME
  JMP main_0
