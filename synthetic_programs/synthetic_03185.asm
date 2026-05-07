; input driven program
; initialization
  LDI r8, 3504
  LDI r11, 2
  LDI r1, 2990
main_0:
  SHR r6, r1, r2
  SHLI r5, r12, 0x7863C2
  XOR r6, r14, r5
  XOR r2, r6, r9
  AND r3, r1, r15
  SUBI r3, r12, 0x57149F
  LDI r7, 2488
  LDI r0, 256
  LDI r13, 3865
  WPIXEL
  LDI r9, 226
  FILL r9
  XOR r3, r12, r9
  OR r6, r8, r18
  XOR r6, r15, r2
  OR r19, r2, r15
  FRAME
  JMP main_0
