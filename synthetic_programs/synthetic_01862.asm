; input driven program
; initialization
  LDI r3, 4
  LDI r7, 2081
  LDI r12, 16
  LDI r2, 255
  LDI r0, 1
main_0:
  LDI r7, 2527
  LDI r13, 2928
  LDI r9, 0xDD1F22
  WPIXEL
  SHR r4, r9, r6
  SHR r9, r14, r15
  SHLI r9, r8, 7
  SHR r9, r3, r15
  CMPI r9, 1
  CMPI r8, 95
  CMPI r10, 128
  FRAME
  JMP main_0
