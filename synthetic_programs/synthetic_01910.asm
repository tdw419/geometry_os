; math computation
; initialization
  LDI r13, 0x145C71
  LDI r5, 16
  LDI r3, 681
  SUBI r2, r9, 10
  MUL r4, r9, r3
  ANDI r9, r11, 3
  SUBI r3, r13, 4
  CMPI r1, r10, 4
  CMPI r7, r10, 0xE5CD93
  ADDI r11, r12, 4
  SHR r9, r1, r13
  SHLI r11, r10, 32
  SHL r10, r2, r8
  HALT
