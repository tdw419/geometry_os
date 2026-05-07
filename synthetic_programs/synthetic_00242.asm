; input driven program
; initialization
  LDI r0, 255
  LDI r10, 0
main_0:
  OR r2, r10, r6
  AND r13, r0, r10
  XOR r2, r13, r10
  AND r3, r15, r1
  XOR r5, r3, r8
  XOR r3, r2, r11
  SUBI r9, r13, 1
  CMPI r14, 0
  SAR r12, r9, r4
  SHLI r3, r12, 1
  SHLI r8, r3, 3
  SHR r0, r3, r10
  FRAME
  JMP main_0
