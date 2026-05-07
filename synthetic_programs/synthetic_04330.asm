; mixed program
; initialization
  LDI r4, 255
  LDI r8, 0x9DDBCF
  LDI r13, 16
  LDI r1, 2
  LDI r12, 0xD3DF5B
  XOR r26, r13, r2
  AND r8, r14, r6
  AND r5, r3, r1
  AND r3, r6, r9
  AND r1, r12, r6
  XOR r11, r13, r15
  OR r7, r3, r6
  CMP r6, r8
  JZ r6, else_0
  ADD r8, r13, r10
  JMP endif_1
else_0:
  LDI r6, 1
  LDI r1, 541
  LDI r11, 255
  WPIXEL
endif_1:
  CMPI r12, 95
  HALT
