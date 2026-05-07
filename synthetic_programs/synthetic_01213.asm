; input driven program
; initialization
  LDI r12, 682
  LDI r13, 0x26C6E8
  LDI r10, 0xD53BCC
  LDI r3, 0x8585A6
  LDI r6, 0x2183FF
  LDI r8, 0x87DA19
main_0:
  SAR r2, r4, r13
  SHLI r0, r4, 4
  SHLI r15, r6, 5
  IKEY r11
  CMPI r11, 244
  JNZ r11, key_1
  DIV r5, r4, r7
  FRAME
  JMP main_0
