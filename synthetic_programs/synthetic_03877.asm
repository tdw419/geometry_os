; input driven program
; initialization
  LDI r10, 76
  LDI r7, 1
  LDI r13, 0x1214C9
  LDI r2, 0x042526
  LDI r9, 32
  LDI r11, 1
  LDI r12, 0xBA3DA1
  LDI r15, 64
main_0:
  SAR r6, r22, r0
  SHLI r0, r3, 16
  SHL r11, r8, r9
  SHR r0, r29, r17
  LDI r14, 2
  LDI r0, 255
  LDI r7, 1
  PSETI
  OR r0, r15, r20
  XOR r6, r14, r3
  XOR r4, r0, r5
  SHLI r13, r7, 8
  SAR r14, r2, r11
  LDI r6, 256
  LDI r9, 677
  LDI r31, 2062
  LDI r12, 0x0C7719
  LDI r4, 16
  RECTF r6, r9, r31, r12, r4
  FRAME
  JMP main_0
