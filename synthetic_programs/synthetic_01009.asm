; input driven program
; initialization
  LDI r5, 64
  LDI r6, 4
  LDI r0, 255
  LDI r7, 4031
  LDI r30, 3832
main_0:
  ADDI r0, r14, 0x8B78C1
  CMP r4, r14
  IKEY r2
  CMPI r2, 32
  JNZ r2, key_1
  FRAME
  JMP main_0
