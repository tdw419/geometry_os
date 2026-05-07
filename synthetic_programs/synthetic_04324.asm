; input driven program
; initialization
  LDI r12, 64
  LDI r1, 3363
  LDI r8, 0xCB7EF7
  LDI r11, 16
main_0:
  OR r2, r11, r13
  AND r1, r7, r2
  AND r11, r0, r4
  OR r7, r13, r8
  CMPI r5, 256
  LDI r6, 64
  LDI r14, 128
  LDI r15, 627
  DRAWTEXT r6, r14, r15, "WORLD"
  SHLI r9, r6, 0x5424FC
  SHLI r19, r10, 0
  SHLI r15, r10, 2
  SAR r1, r7, r9
  XOR r6, r8, r11
  XOR r4, r5, r10
  XOR r3, r14, r9
  FRAME
  JMP main_0
