; input driven program
; initialization
  LDI r5, 256
  LDI r7, 0x0FAA5A
  LDI r8, 10
main_0:
  IKEY r2
  CMPI r2, 0xDFDA5E
  JNZ r2, key_1
  AND r4, r1, r14
  OR r1, r26, r12
  AND r12, r7, r15
  XOR r15, r8, r12
  CMP r9, r2
  SUBI r14, r2, 219
  LDI r13, 642
  LDI r9, 2
  LDI r15, 64
  TEXT r13, r9, r15, "HELLO"
  IKEY r14
  CMPI r14, 0x5B3763
  JNZ r14, key_2
  FRAME
  JMP main_0
