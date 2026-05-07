; input driven program
; initialization
  LDI r4, 0x5E1FB4
  LDI r2, 0x1A929D
  LDI r8, 0
  LDI r7, 255
  LDI r14, 2944
  LDI r12, 10
  LDI r0, 3908
main_0:
  AND r12, r3, r28
  XOR r14, r12, r1
  SHLI r8, r12, 0x2905A7
  SHR r12, r9, r1
  OR r3, r14, r0
  FRAME
  JMP main_0
