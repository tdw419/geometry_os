; counted animation
; initialization
  LDI r3, 1043
  LDI r14, 0x985E7B
  LDI r19, 2035
  LDI r0, 0
  LDI r12, 0
  LDI r8, 0x125608
  LDI r22, 2468
  LDI r8, 0
loop_0:
  LDI r14, 0xA83971
  LDI r0, 1059
  LDI r1, 32
  WPIXEL
  OR r12, r8, r2
  LDI r10, 1
  SUB r8, r8, r10
  JNZ r8, loop_0
  LDI r8, 2
loop_1:
  SUBI r5, r17, 223
  LDI r4, 443
  LDI r11, 0x1355D2
  LDI r12, 128
  PSETI
  SUBI r11, r12, 125
  LDI r3, 1
  SUB r8, r8, r3
  JNZ r8, loop_1
  HALT
