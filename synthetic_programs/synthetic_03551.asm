; input driven program
; initialization
  LDI r9, 0xFD3E48
  LDI r11, 0xD82019
  LDI r5, 0x2969E0
  LDI r23, 1
  LDI r8, 1
  LDI r1, 8
main_0:
  SUBI r15, r6, 32
  IKEY r7
  CMPI r7, 0x97E9CB
  JNZ r7, key_1
  XOR r15, r12, r23
  OR r2, r1, r13
  OR r13, r7, r6
  AND r12, r13, r10
  CMPI r15, 2
  IKEY r1
  CMPI r1, 0x91739A
  JNZ r1, key_2
  FRAME
  JMP main_0
