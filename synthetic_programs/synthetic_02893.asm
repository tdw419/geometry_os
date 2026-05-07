; input driven program
; initialization
  LDI r14, 10
  LDI r9, 0x32E9BB
  LDI r13, 4
  LDI r0, 3879
  LDI r1, 0xEB3B75
  LDI r7, 0xF7E51A
  LDI r26, 0x97CF65
main_0:
  LDI r13, 0x0C3A77
  LDI r3, 2991
  LDI r5, 255
  LDI r11, 0x9C8084
  CIRCLE r13, r3, r5, r11
  LDI r14, 1
  LDI r7, 32
  LDI r10, 0xB83F27
  PSET r14, r7, r10
  AND r9, r11, r12
  OR r12, r0, r11
  XOR r11, r9, r7
  IKEY r8
  CMPI r8, 256
  JNZ r8, key_1
  FRAME
  JMP main_0
