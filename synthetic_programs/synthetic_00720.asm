; input driven program
; initialization
  LDI r14, 886
  LDI r15, 2365
  LDI r12, 10
main_0:
  SHR r9, r10, r8
  SHL r5, r6, r1
  SHR r10, r5, r13
  SHL r10, r0, r11
  XOR r7, r6, r5
  OR r1, r7, r13
  XOR r1, r7, r30
  OR r5, r31, r2
  SHLI r12, r1, 0x37FCD7
  SHR r15, r14, r22
  SHR r0, r8, r6
  SUBI r12, r8, 5
  SUBI r5, r7, 104
  SHR r3, r6, r0
  SAR r13, r15, r5
  FRAME
  JMP main_0
