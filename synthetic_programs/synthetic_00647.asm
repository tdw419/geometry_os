; input driven program
; initialization
  LDI r4, 3424
  LDI r3, 256
  LDI r31, 0x391898
  LDI r2, 0x173531
  LDI r9, 57
  LDI r13, 2750
  LDI r1, 64
main_0:
  LDI r3, 4
  LDI r1, 0xCC16DE
  LDI r3, 0x6ADCF7
  PSET r3, r1, r3
  IKEY r6
  CMPI r6, 128
  JNZ r6, key_1
  SHR r15, r8, r6
  SHL r8, r15, r11
  SHL r13, r14, r9
  ANDI r1, r8, 102
  FRAME
  JMP main_0
