; input driven program
; initialization
  LDI r15, 3923
  LDI r14, 3583
  LDI r3, 0x5B4D82
main_0:
  SHR r0, r13, r2
  SHR r4, r15, r3
  SHR r11, r2, r4
  SHLI r5, r11, 0xD79E73
  CMPI r26, 90
  SHLI r3, r1, 1
  SHR r8, r10, r14
  SHL r2, r7, r6
  FRAME
  JMP main_0
