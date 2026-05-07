; counted animation
; initialization
  LDI r1, 16
  LDI r12, 64
  LDI r11, 2431
  LDI r12, 23
loop_0:
  SUBI r0, r8, 0xF08511
  XOR r28, r14, r1
  MUL r9, r14, r13
  SUB r8, r25, r2
  LDI r0, 1
  SUB r12, r12, r0
  JNZ r12, loop_0
  LDI r3, 31
loop_1:
  LDI r9, 0x5F30E9
  LDI r4, 0x164292
  LDI r14, 2140
  PSETI
  OR r13, r10, r7
  LDI r1, 1930
  LDI r23, 1795
  LDI r4, 1922
  LDI r10, 16
  CIRCLE r1, r23, r4, r10
  SHR r11, r4, r9
  LDI r8, 1
  SUB r3, r3, r8
  JNZ r3, loop_1
  LDI r3, 0xEC867B
loop_2:
  LDI r0, 10
  LDI r8, 0x2ABA71
  LDI r0, 2
  LDI r0, 8
  CIRCLE r0, r8, r0, r0
  XOR r6, r11, r14
  LDI r11, 161
  LDI r2, 0
  LDI r9, 64
  PSET r11, r2, r9
  SHR r14, r6, r7
  LDI r15, 1
  SUB r3, r3, r15
  JNZ r3, loop_2
  HALT
