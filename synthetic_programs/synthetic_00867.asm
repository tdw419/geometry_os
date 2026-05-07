; input driven program
; initialization
  LDI r2, 1039
  LDI r3, 2464
main_0:
  IKEY r11
  CMPI r11, 255
  JNZ r11, key_1
  IKEY r14
  CMPI r14, 0x650EBE
  JNZ r14, key_2
  SHR r1, r8, r13
  CMPI r16, 41
  CMP r1, r7
  FRAME
  JMP main_0
