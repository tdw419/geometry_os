; drawing loop program
; initialization
  LDI r11, 3961
  LDI r6, 646
main_0:
  AND r11, r3, r9
  XOR r11, r15, r12
  OR r4, r7, r9
  SUBI r7, r4, 32
  CMP r2, r15
  IKEY r10
  CMPI r10, 0
  JNZ r10, key_1
  AND r2, r5, r7
  FRAME
  JMP main_0
