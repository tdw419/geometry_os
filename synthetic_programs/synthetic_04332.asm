; input driven program
; initialization
  LDI r12, 256
  LDI r4, 128
  LDI r10, 0
  LDI r13, 4
  LDI r0, 2142
  LDI r14, 3852
  LDI r2, 0x029B43
main_0:
  LDI r23, 4095
  LDI r10, 0
  LDI r4, 1401
  DRAWTEXT r23, r10, r4, "WORLD"
  MOD r1, r0, r10
  XOR r2, r0, r14
  XOR r10, r16, r2
  XOR r14, r11, r31
  OR r13, r14, r9
  IKEY r9
  CMPI r9, 19
  JNZ r9, key_1
  LDI r15, 0x05A86B
  LDI r11, 0x25B397
  LDI r1, 3658
  DRAWTEXT r15, r11, r1, "WORLD"
  FRAME
  JMP main_0
