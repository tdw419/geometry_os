; input driven program
; initialization
  LDI r12, 256
  LDI r19, 3500
  LDI r2, 3934
main_0:
  SUBI r6, r4, 0x035FE7
  SAR r0, r11, r5
  SHL r11, r9, r13
  SHL r9, r15, r12
  SHLI r14, r7, 2
  OR r6, r15, r2
  OR r15, r13, r8
  OR r9, r14, r7
  XOR r9, r10, r8
  LDI r4, 3834
  LDI r4, 1828
  LDI r8, 256
  TEXT r4, r4, r8, "HELLO"
  AND r13, r1, r12
  OR r6, r3, r0
  XOR r13, r26, r10
  XOR r12, r8, r11
  XOR r6, r11, r9
  FRAME
  JMP main_0
