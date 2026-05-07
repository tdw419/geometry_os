; drawing loop program
; initialization
  LDI r11, 978
  LDI r1, 255
  LDI r15, 32
  LDI r13, 2310
  LDI r10, 0x42293D
  LDI r4, 0xCA7E16
main_0:
  OR r14, r0, r3
  XOR r11, r10, r3
  XOR r8, r14, r13
  LDI r11, 0xEB3274
  FILL r11
  IKEY r7
  CMPI r7, 128
  JNZ r7, key_1
  XOR r7, r5, r4
  IKEY r9
  CMPI r9, 255
  JNZ r9, key_2
  SHR r13, r4, r1
  SHL r14, r10, r15
  SAR r19, r14, r3
  FRAME
  JMP main_0
