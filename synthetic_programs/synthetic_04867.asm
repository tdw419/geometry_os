; input driven program
; initialization
  LDI r13, 128
  LDI r12, 1
  LDI r0, 0x2CBE16
  LDI r1, 0x67C43D
main_0:
  CMP r11, r1
  DIV r2, r10, r9
  SAR r15, r0, r8
  SHR r0, r9, r31
  SHLI r11, r2, 7
  SHLI r8, r2, 256
  FRAME
  JMP main_0
