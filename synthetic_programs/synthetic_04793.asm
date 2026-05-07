; input driven program
; initialization
  LDI r4, 0x0F7C98
  LDI r11, 1456
  LDI r14, 1488
  LDI r10, 0x2EBF81
  LDI r13, 3160
  LDI r0, 255
  LDI r3, 2
  LDI r6, 2
main_0:
  IKEY r13
  CMPI r13, 72
  JNZ r13, key_1
  LDI r3, 3845
  LDI r14, 256
  LDI r1, 0x0258A5
  DRAWTEXT r3, r14, r1, "WORLD"
  AND r9, r0, r30
  AND r1, r15, r12
  OR r15, r6, r13
  OR r30, r14, r2
  LDI r4, 0x397C56
  LDI r8, 2842
  LDI r27, 2378
  PSET r4, r8, r27
  FRAME
  JMP main_0
