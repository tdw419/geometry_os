; input driven program
; initialization
  LDI r2, 16
  LDI r11, 2
  LDI r12, 0xF47F4F
  LDI r1, 2201
  LDI r0, 8
  LDI r8, 0xDC3BC8
  LDI r13, 2113
main_0:
  SAR r12, r8, r3
  SHR r9, r2, r10
  LDI r15, 1094
  LDI r4, 3039
  LDI r13, 16
  PSETI
  IKEY r4
  CMPI r4, 0xCE1E61
  JNZ r4, key_1
  FRAME
  JMP main_0
