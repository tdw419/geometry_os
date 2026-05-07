; input driven program
; initialization
  LDI r7, 0xC8C989
  LDI r8, 2050
  LDI r1, 32
main_0:
  OR r0, r5, r4
  CMPI r15, r10, 256
  ADDI r7, r12, 0xC38519
  IKEY r9
  CMPI r9, 128
  JNZ r9, key_1
  FRAME
  JMP main_0
