; drawing loop program
; initialization
  LDI r25, 0x5F0A84
  LDI r3, 0xAF283E
  LDI r12, 0xFBEE59
  LDI r6, 0x8B3B91
  LDI r0, 2188
  LDI r10, 297
main_0:
  ADDI r4, r13, 0xBA0B2E
  IKEY r24
  CMPI r24, 2
  JNZ r24, key_1
  CMP r11, r12
  FRAME
  JMP main_0
