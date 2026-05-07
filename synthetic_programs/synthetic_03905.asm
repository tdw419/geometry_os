; input driven program
; initialization
  LDI r13, 256
  LDI r9, 2135
  LDI r18, 10
  LDI r7, 8
main_0:
  CMPI r11, 255
  SHR r6, r15, r1
  SHR r7, r5, r0
  SAR r12, r8, r1
  SHR r3, r13, r5
  SAR r0, r8, r12
  SAR r0, r11, r12
  LDI r6, 0x5F81A4
  LDI r14, 822
  LDI r12, 255
  TEXT r6, r14, r12, "HELLO"
  CMPI r7, 156
  FRAME
  JMP main_0
