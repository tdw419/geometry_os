; drawing loop program
; initialization
  LDI r7, 0x3B13FA
  LDI r9, 128
  LDI r10, 255
main_0:
  IKEY r2
  CMPI r2, 8
  JNZ r2, key_1
  CMPI r22, 256
  CMP r21, r6
  LDI r4, 32
  LDI r15, 0
  LDI r3, 8
  PSETI
  AND r2, r15, r13
  OR r5, r14, r13
  FRAME
  JMP main_0
