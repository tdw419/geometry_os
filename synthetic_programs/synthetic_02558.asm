; input driven program
; initialization
  LDI r0, 128
  LDI r1, 0
  LDI r30, 64
  LDI r13, 2468
main_0:
  SUB r4, r11, r14
  SHL r11, r1, r5
  SHLI r4, r6, 256
  SHLI r0, r8, 0x7427AE
  OR r3, r1, r0
  OR r12, r11, r7
  AND r14, r3, r6
  AND r6, r11, r14
  FRAME
  JMP main_0
