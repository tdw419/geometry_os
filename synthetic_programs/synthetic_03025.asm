; drawing loop program
; initialization
  LDI r2, 10
  LDI r14, 128
  LDI r5, 0xA9EF7A
  LDI r10, 8
  LDI r6, 1573
main_0:
  SHR r9, r5, r11
  SHL r12, r1, r3
  IKEY r11
  CMPI r11, 32
  JNZ r11, key_1
  IKEY r15
  CMPI r15, 256
  JNZ r15, key_2
  FRAME
  JMP main_0
