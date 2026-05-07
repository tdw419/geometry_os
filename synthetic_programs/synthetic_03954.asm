; drawing loop program
; initialization
  LDI r5, 1768
  LDI r12, 0xCFD987
  LDI r4, 0xF849E7
  LDI r6, 0x122DDE
  LDI r7, 1862
  LDI r13, 2
main_0:
  OR r1, r6, r3
  AND r6, r18, r13
  OR r4, r12, r14
  LDI r2, 94
  LDI r13, 0x75FFBD
  LDI r9, 727
  LDI r0, 2720
  LDI r0, 1
  LINE r2, r13, r9, r0, r0
  LDI r17, 3090
  LDI r14, 768
  LDI r9, 833
  TEXT r17, r14, r9, "HELLO"
  FRAME
  JMP main_0
