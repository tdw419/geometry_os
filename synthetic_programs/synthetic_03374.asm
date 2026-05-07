; input driven program
; initialization
  LDI r9, 1189
  LDI r10, 8
  LDI r5, 0x0743FE
  LDI r13, 2871
  LDI r11, 32
main_0:
  OR r9, r8, r13
  AND r5, r11, r15
  OR r8, r13, r4
  IKEY r13
  CMPI r13, 0xD5EF65
  JNZ r13, key_1
  ANDI r0, r3, 0xC91B64
  ANDI r11, r1, 0x4BF7C7
  FRAME
  JMP main_0
