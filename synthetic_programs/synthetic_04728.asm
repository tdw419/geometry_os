; mixed program
; initialization
  LDI r7, 1917
  LDI r12, 38
  LDI r4, 3204
  LDI r3, 0
  LDI r1, 0x16253E
  LDI r5, 165
  AND r8, r11, r5
  XOR r1, r8, r5
  CMP r0, r4
  JZ r0, else_0
  MUL r2, r4, r12
  JMP endif_1
else_0:
  LDI r7, 256
  LDI r12, 1782
  LDI r2, 8
  LDI r13, 2569
  LDI r15, 1188
  LINE r7, r12, r2, r13, r15
  LDI r0, 0x617F8D
  LDI r4, 0x706A83
  LDI r2, 128
  PSETI
  LDI r10, 0xF48C09
  LDI r0, 0x6D0321
  LDI r0, 128
  LDI r7, 3403
  LDI r5, 2618
  LINE r10, r0, r0, r7, r5
endif_1:
  SHR r6, r4, r5
  SAR r0, r11, r8
  SAR r13, r15, r6
  HALT
