; input driven program
; initialization
  LDI r0, 64
  LDI r7, 0x176021
  LDI r15, 0x47795B
  LDI r11, 2176
  LDI r4, 0x65A14A
  LDI r31, 1912
  LDI r14, 802
  LDI r3, 0x8A7D2A
main_0:
  ANDI r4, r0, 255
  LDI r12, 1398
  LDI r3, 0x0AB792
  LDI r5, 0
  TEXT r12, r3, r5, "HELLO"
  CMPI r3, r21, 8
  XOR r18, r13, r3
  OR r4, r0, r2
  OR r9, r5, r3
  AND r7, r8, r5
  FRAME
  JMP main_0
