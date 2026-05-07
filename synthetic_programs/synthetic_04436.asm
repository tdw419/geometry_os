; input driven program
; initialization
  LDI r10, 2981
  LDI r4, 1
  LDI r1, 256
  LDI r11, 2620
  LDI r3, 0x4102FE
main_0:
  SUBI r7, r1, 255
  AND r12, r8, r0
  OR r7, r13, r2
  OR r10, r12, r13
  AND r7, r12, r15
  AND r8, r3, r15
  AND r7, r10, r6
  CMPI r11, 0x642F21
  CMPI r10, r0, 64
  FRAME
  JMP main_0
