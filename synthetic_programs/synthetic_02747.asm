; input driven program
; initialization
  LDI r20, 0x49EB96
  LDI r3, 577
  LDI r10, 3639
main_0:
  LDI r15, 0x798151
  LDI r13, 0xB8AA20
  LDI r12, 3158
  TEXT r15, r13, r12, "HELLO"
  SHR r4, r3, r9
  SHL r9, r12, r11
  SHLI r25, r1, 32
  SAR r8, r14, r4
  OR r4, r13, r9
  XOR r5, r0, r11
  OR r3, r0, r14
  IKEY r1
  CMPI r1, 240
  JNZ r1, key_1
  LDI r7, 564
  FILL r7
  LDI r9, 1
  LDI r10, 0xCFE5F2
  LDI r1, 4
  DRAWTEXT r9, r10, r1, "WORLD"
  FRAME
  JMP main_0
