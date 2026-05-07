; mixed program
; initialization
  LDI r0, 255
  LDI r9, 64
  LDI r4, 0xD4D8F7
  LDI r14, 0x165C9C
  LDI r8, 2299
  LDI r12, 0x7052DC
  LDI r5, 10
  LDI r2, 1192
  CMP r6, r31
  JZ r6, else_0
  AND r13, r23, r1
  ADD r2, r7, r10
  ADD r15, r8, r12
  DIV r3, r8, r0
  JMP endif_1
else_0:
  LDI r15, 0x26C129
  LDI r14, 0x277976
  LDI r5, 1
  LDI r9, 2836
  LDI r3, 8
  LINE r15, r14, r5, r9, r3
  LDI r8, 64
  LDI r6, 64
  LDI r9, 64
  PSETI
  LDI r5, 2884
  FILL r5
endif_1:
  LDI r4, 32
  LDI r4, 0x309DC1
  LDI r2, 1495
  DRAWTEXT r4, r4, r2, "WORLD"
  AND r8, r13, r0
  AND r14, r3, r2
  OR r6, r11, r10
  HALT
