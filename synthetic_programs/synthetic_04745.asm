; input driven program
; initialization
  LDI r0, 0x5F55C0
  LDI r3, 8
  LDI r6, 8
  LDI r12, 1307
main_0:
  SHR r8, r13, r4
  SAR r7, r8, r19
  SHL r0, r1, r23
  SHL r10, r15, r12
  SHLI r15, r4, 4
  XOR r11, r8, r12
  FRAME
  JMP main_0
