; input driven program
; initialization
  LDI r24, 32
  LDI r3, 16
  LDI r10, 16
  LDI r13, 256
  LDI r12, 32
  LDI r1, 0x20DD66
  LDI r7, 0x8A2445
  LDI r15, 0x0519C1
main_0:
  SHR r1, r8, r10
  SHL r6, r10, r9
  SUBI r10, r4, 105
  XOR r1, r14, r8
  OR r5, r2, r3
  XOR r5, r0, r13
  OR r12, r7, r10
  IKEY r4
  CMPI r4, 16
  JNZ r4, key_1
  LDI r12, 0
  FILL r12
  FRAME
  JMP main_0
