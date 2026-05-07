; input driven program
; initialization
  LDI r10, 2
  LDI r4, 0x028898
main_0:
  SUBI r12, r14, 104
  AND r12, r7, r14
  XOR r15, r20, r7
  XOR r14, r9, r12
  OR r15, r10, r7
  LDI r4, 10
  LDI r9, 1698
  LDI r4, 0xDE6B82
  TEXT r4, r9, r4, "HELLO"
  FRAME
  JMP main_0
