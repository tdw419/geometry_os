; input driven program
; initialization
  LDI r15, 0x2FA635
  LDI r11, 4
  LDI r5, 0x45EA1D
  LDI r3, 256
main_0:
  SHL r13, r4, r0
  SHLI r2, r10, 4
  SHR r7, r14, r12
  CMP r5, r14
  CMPI r3, r9, 256
  FRAME
  JMP main_0
