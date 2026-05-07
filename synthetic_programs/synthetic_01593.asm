; input driven program
; initialization
  LDI r15, 0x3AF5F6
  LDI r12, 0x1035C9
main_0:
  IKEY r13
  CMPI r13, 0xE6F3F2
  JNZ r13, key_1
  LDI r0, 2410
  LDI r14, 0xF3A1D5
  LDI r14, 1447
  TEXT r0, r14, r14, "HELLO"
  SHR r5, r0, r1
  SHR r5, r3, r15
  SHL r9, r15, r0
  FRAME
  JMP main_0
