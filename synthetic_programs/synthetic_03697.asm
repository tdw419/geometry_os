; input driven program
; initialization
  LDI r12, 296
  LDI r7, 3515
  LDI r9, 1010
  LDI r8, 3329
  LDI r14, 0x338F5E
main_0:
  SHL r15, r7, r11
  SHR r13, r14, r5
  SHL r0, r11, r12
  CMPI r11, r3, 1
  OR r5, r2, r14
  OR r14, r9, r15
  XOR r4, r13, r6
  OR r30, r2, r4
  FRAME
  JMP main_0
