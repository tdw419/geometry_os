; input driven program
; initialization
  LDI r10, 255
  LDI r8, 0x775D05
  LDI r4, 0xE93F9C
main_0:
  OR r0, r1, r4
  XOR r14, r12, r7
  OR r6, r8, r12
  OR r7, r2, r13
  SUBI r13, r1, 0x9E3FA7
  CMP r6, r15
  LDI r3, 1
  FILL r3
  OR r11, r6, r4
  DIV r3, r6, r11
  FRAME
  JMP main_0
