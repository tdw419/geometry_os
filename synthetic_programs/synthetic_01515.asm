; input driven program
; initialization
  LDI r10, 0xE790C3
  LDI r24, 2
  LDI r12, 256
  LDI r1, 0xCEAE69
  LDI r13, 4011
  LDI r3, 2710
  LDI r6, 2
  LDI r0, 32
main_0:
  CMP r13, r6
  CMPI r2, r1, 196
  LDI r3, 4069
  LDI r0, 1678
  LDI r9, 0x90AB84
  DRAWTEXT r3, r0, r9, "WORLD"
  CMP r2, r1
  MUL r5, r11, r1
  FRAME
  JMP main_0
