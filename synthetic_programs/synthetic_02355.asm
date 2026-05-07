; drawing loop program
; initialization
  LDI r6, 8
  LDI r4, 0x00DE6E
  LDI r11, 0x023884
  LDI r9, 4
  LDI r12, 2545
main_0:
  SHR r13, r12, r4
  CMPI r5, 0x417B5B
  IKEY r2
  CMPI r2, 45
  JNZ r2, key_1
  XOR r12, r14, r0
  XOR r0, r12, r8
  XOR r13, r1, r20
  FRAME
  JMP main_0
