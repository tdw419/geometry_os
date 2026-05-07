; drawing loop program
; initialization
  LDI r3, 255
  LDI r2, 2279
main_0:
  SHL r5, r13, r8
  IKEY r12
  CMPI r12, 73
  JNZ r12, key_1
  LDI r1, 0x69C2E6
  LDI r14, 922
  LDI r7, 256
  WPIXEL
  SUBI r1, r4, 32
  LDI r30, 0x65AC67
  LDI r12, 0x22621C
  LDI r14, 380
  TEXT r30, r12, r14, "HELLO"
  SUBI r2, r0, 16
  FRAME
  JMP main_0
