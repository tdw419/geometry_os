; input driven program
; initialization
  LDI r2, 0x2C4BA1
  LDI r1, 2431
  LDI r4, 1771
  LDI r5, 16
  LDI r6, 3559
  LDI r12, 0xE7A35F
  LDI r15, 32
  LDI r8, 2
main_0:
  IKEY r15
  CMPI r15, 256
  JNZ r15, key_1
  IKEY r5
  CMPI r5, 16
  JNZ r5, key_2
  ANDI r5, r15, 29
  ADDI r5, r0, 139
  SHR r5, r13, r0
  SAR r7, r8, r5
  SHL r21, r15, r7
  SHL r13, r6, r4
  IKEY r5
  CMPI r5, 3
  JNZ r5, key_3
  FRAME
  JMP main_0
