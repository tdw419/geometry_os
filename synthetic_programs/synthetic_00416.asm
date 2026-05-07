; input driven program
; initialization
  LDI r24, 32
  LDI r5, 0x8F65B2
  LDI r7, 16
  LDI r14, 1127
  LDI r4, 128
main_0:
  LDI r1, 0xEE70B6
  LDI r5, 0x6EAA55
  LDI r2, 4
  WPIXEL
  AND r2, r14, r3
  XOR r12, r15, r10
  XOR r1, r14, r9
  ANDI r0, r9, 233
  CMPI r12, 50
  CMPI r1, r4, 196
  FRAME
  JMP main_0
