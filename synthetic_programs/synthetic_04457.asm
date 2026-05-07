; input driven program
; initialization
  LDI r15, 0x98FDFE
  LDI r3, 1848
  LDI r13, 3312
main_0:
  SHLI r14, r10, 64
  SHL r2, r5, r4
  SHR r15, r8, r11
  SHR r14, r4, r6
  ANDI r11, r5, 0xAAA5E4
  IKEY r10
  CMPI r10, 0x44C2F7
  JNZ r10, key_1
  SUBI r14, r11, 56
  LDI r5, 1754
  LDI r12, 0x1A589B
  LDI r23, 0xE82418
  PSET r5, r12, r23
  LDI r11, 1281
  LDI r15, 0x0DDF2C
  LDI r7, 3702
  PSETI
  FRAME
  JMP main_0
