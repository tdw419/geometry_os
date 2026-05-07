; input driven program
; initialization
  LDI r5, 64
  LDI r9, 0x04C9AD
  LDI r1, 3748
  LDI r12, 1216
  LDI r3, 128
  LDI r0, 1546
  LDI r14, 0xC0B9E6
  LDI r2, 0x38E638
main_0:
  IKEY r11
  CMPI r11, 161
  JNZ r11, key_1
  CMP r14, r9
  SHR r6, r3, r9
  SHR r3, r9, r0
  IKEY r15
  CMPI r15, 255
  JNZ r15, key_2
  IKEY r15
  CMPI r15, 73
  JNZ r15, key_3
  FRAME
  JMP main_0
