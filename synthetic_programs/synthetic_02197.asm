; input driven program
; initialization
  LDI r10, 866
  LDI r12, 1275
main_0:
  LDI r9, 0xDC02DF
  LDI r12, 3432
  LDI r10, 64
  DRAWTEXT r9, r12, r10, "WORLD"
  CMP r11, r1
  AND r0, r3, r9
  OR r13, r9, r15
  OR r9, r2, r13
  OR r11, r2, r0
  IKEY r6
  CMPI r6, 64
  JNZ r6, key_1
  FRAME
  JMP main_0
