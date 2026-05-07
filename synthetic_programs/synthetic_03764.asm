; input driven program
; initialization
  LDI r1, 0x99784F
  LDI r5, 936
main_0:
  LDI r0, 1831
  LDI r8, 32
  LDI r7, 2712
  PSET r0, r8, r7
  ANDI r7, r5, 32
  IKEY r13
  CMPI r13, 0x9C3A19
  JNZ r13, key_1
  XOR r9, r13, r7
  XOR r7, r8, r10
  AND r15, r19, r25
  XOR r2, r9, r15
  IKEY r2
  CMPI r2, 0xC48E09
  JNZ r2, key_2
  FRAME
  JMP main_0
