; input driven program
; initialization
  LDI r14, 0x602462
  LDI r1, 2327
  LDI r8, 2
  LDI r6, 0x9139F5
  LDI r3, 109
main_0:
  CMP r12, r13
  CMPI r6, r10, 130
  XOR r9, r6, r13
  XOR r5, r7, r6
  AND r2, r5, r9
  OR r13, r3, r28
  FRAME
  JMP main_0
