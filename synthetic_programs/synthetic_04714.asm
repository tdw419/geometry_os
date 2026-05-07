; drawing loop program
; initialization
  LDI r16, 3272
  LDI r15, 1875
main_0:
  LDI r13, 2060
  LDI r16, 255
  LDI r28, 1
  TEXT r13, r16, r28, "HELLO"
  LDI r0, 0x3CE1EA
  LDI r2, 0x5F2A3E
  LDI r12, 8
  PSET r0, r2, r12
  SHL r3, r14, r10
  LDI r5, 0x261108
  LDI r7, 1676
  LDI r7, 3717
  WPIXEL
  IKEY r15
  CMPI r15, 1
  JNZ r15, key_1
  CMPI r0, 0
  FRAME
  JMP main_0
