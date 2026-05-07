; input driven program
; initialization
  LDI r15, 0x80C9EC
  LDI r1, 0x93A80B
  LDI r9, 255
  LDI r3, 0x95FE69
  LDI r23, 0xC73738
  LDI r8, 32
  LDI r2, 10
  LDI r5, 256
main_0:
  AND r12, r4, r14
  XOR r13, r7, r14
  IKEY r4
  CMPI r4, 81
  JNZ r4, key_1
  ADDI r10, r15, 0xFE401B
  AND r13, r0, r9
  OR r9, r3, r5
  AND r12, r13, r14
  IKEY r11
  CMPI r11, 12
  JNZ r11, key_2
  FRAME
  JMP main_0
