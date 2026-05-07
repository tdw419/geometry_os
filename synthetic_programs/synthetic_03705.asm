; input driven program
; initialization
  LDI r13, 3956
  LDI r9, 0x4FA470
  LDI r10, 0xAE79CB
  LDI r14, 8
  LDI r15, 3598
main_0:
  OR r9, r13, r7
  AND r9, r4, r2
  AND r15, r20, r14
  XOR r7, r15, r0
  XOR r12, r7, r11
  XOR r14, r15, r6
  OR r12, r6, r8
  OR r6, r1, r2
  SHR r6, r12, r9
  SHR r15, r0, r11
  SAR r2, r11, r3
  LDI r7, 1672
  LDI r10, 0
  LDI r4, 64
  DRAWTEXT r7, r10, r4, "WORLD"
  FRAME
  JMP main_0
