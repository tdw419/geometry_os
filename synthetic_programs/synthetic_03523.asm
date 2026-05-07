; input driven program
; initialization
  LDI r12, 255
  LDI r1, 0x327F03
  LDI r13, 256
main_0:
  LDI r7, 10
  LDI r10, 2204
  LDI r9, 4
  LDI r10, 0xB3F9A6
  LDI r4, 0xD1D42B
  LINE r7, r10, r9, r10, r4
  CMPI r14, 70
  LDI r0, 1127
  LDI r0, 0x020347
  LDI r12, 64
  TEXT r0, r0, r12, "HELLO"
  IKEY r13
  CMPI r13, 102
  JNZ r13, key_1
  MUL r8, r11, r0
  FRAME
  JMP main_0
