; input driven program
; initialization
  LDI r12, 1
  LDI r3, 1
  LDI r1, 255
  LDI r10, 3329
  LDI r4, 0x8AD16E
main_0:
  AND r6, r5, r11
  XOR r2, r12, r11
  XOR r12, r14, r11
  XOR r1, r0, r15
  OR r10, r2, r1
  OR r1, r5, r0
  OR r7, r13, r14
  FRAME
  JMP main_0
