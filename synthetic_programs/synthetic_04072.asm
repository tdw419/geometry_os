; input driven program
; initialization
  LDI r12, 0x1EF124
  LDI r1, 805
  LDI r11, 255
  LDI r4, 2
  LDI r5, 3446
  LDI r3, 2
  LDI r8, 1410
  LDI r7, 64
main_0:
  SHR r12, r9, r4
  SHR r2, r11, r4
  SAR r13, r12, r15
  SHR r10, r3, r13
  LDI r5, 128
  LDI r8, 3090
  LDI r4, 0xDF6901
  PSETI
  SHL r2, r8, r9
  SHL r3, r12, r9
  IKEY r3
  CMPI r3, 10
  JNZ r3, key_1
  SHLI r4, r11, 1
  SHLI r1, r0, 0xCF0A7A
  SAR r8, r11, r0
  SAR r12, r7, r13
  FRAME
  JMP main_0
