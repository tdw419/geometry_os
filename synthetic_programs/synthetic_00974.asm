; drawing loop program
; initialization
  LDI r3, 631
  LDI r7, 2313
  LDI r0, 0x10345F
  LDI r1, 10
  LDI r13, 64
  LDI r10, 255
main_0:
  XOR r2, r0, r15
  AND r13, r29, r1
  XOR r12, r5, r11
  SHLI r6, r10, 0xE0DDAF
  SHL r3, r4, r10
  SAR r4, r7, r2
  IKEY r10
  CMPI r10, 255
  JNZ r10, key_1
  XOR r13, r9, r4
  AND r9, r0, r4
  XOR r10, r4, r11
  FRAME
  JMP main_0
