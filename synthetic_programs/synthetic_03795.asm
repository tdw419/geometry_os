; input driven program
; initialization
  LDI r12, 16
  LDI r10, 8
main_0:
  SHR r13, r15, r5
  SAR r6, r3, r10
  SHR r7, r3, r1
  SHLI r12, r14, 2
  SAR r0, r12, r24
  SHR r5, r2, r15
  XOR r11, r14, r7
  LDI r13, 0x9137EA
  LDI r5, 0x0C8FC2
  LDI r3, 10
  WPIXEL
  FRAME
  JMP main_0
