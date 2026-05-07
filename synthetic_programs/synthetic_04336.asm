; input driven program
; initialization
  LDI r12, 0x12A253
  LDI r3, 256
  LDI r2, 3790
  LDI r9, 691
main_0:
  SHR r8, r13, r2
  SHLI r6, r8, 1
  SHL r15, r6, r10
  IKEY r1
  CMPI r1, 7
  JNZ r1, key_1
  IKEY r2
  CMPI r2, 0xA77C8E
  JNZ r2, key_2
  LDI r8, 2
  LDI r4, 0xDD6DAD
  LDI r13, 255
  WPIXEL
  ANDI r0, r12, 0x5C33D5
  SHR r7, r4, r9
  SHR r2, r4, r5
  SHL r11, r7, r14
  FRAME
  JMP main_0
