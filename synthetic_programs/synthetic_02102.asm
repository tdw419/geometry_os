; input driven program
; initialization
  LDI r2, 2
  LDI r3, 3603
  LDI r13, 128
  LDI r12, 0xFD82A9
  LDI r10, 64
  LDI r11, 0xE1FCCA
  LDI r0, 1064
main_0:
  OR r4, r0, r6
  XOR r1, r11, r13
  XOR r1, r4, r8
  OR r9, r6, r2
  SHR r11, r14, r9
  SHR r0, r14, r5
  IKEY r10
  CMPI r10, 0xE4992C
  JNZ r10, key_1
  AND r8, r4, r12
  XOR r9, r1, r30
  FRAME
  JMP main_0
