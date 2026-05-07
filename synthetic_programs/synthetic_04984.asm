; input driven program
; initialization
  LDI r3, 16
  LDI r9, 0xB71A0D
  LDI r8, 0x64A37D
  LDI r12, 4
main_0:
  LDI r2, 1745
  LDI r10, 1
  LDI r11, 32
  DRAWTEXT r2, r10, r11, "WORLD"
  SHL r15, r6, r7
  SAR r13, r5, r0
  FRAME
  JMP main_0
