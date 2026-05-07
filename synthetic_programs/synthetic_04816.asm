; input driven program
; initialization
  LDI r8, 0x981D6C
  LDI r7, 8
  LDI r2, 367
  LDI r5, 0x7B8ABD
  LDI r9, 0
  LDI r11, 128
  LDI r14, 0x6E36CE
  LDI r1, 0x6E1027
main_0:
  AND r9, r5, r8
  AND r8, r13, r3
  AND r4, r6, r14
  OR r5, r8, r13
  IKEY r15
  CMPI r15, 256
  JNZ r15, key_1
  ADDI r14, r5, 196
  AND r7, r13, r15
  OR r1, r12, r15
  XOR r3, r11, r7
  AND r6, r5, r0
  FRAME
  JMP main_0
