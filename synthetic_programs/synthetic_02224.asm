; drawing loop program
; initialization
  LDI r4, 2686
  LDI r11, 3393
  LDI r8, 3840
  LDI r15, 2232
  LDI r10, 2473
  LDI r0, 10
main_0:
  XOR r2, r7, r6
  OR r5, r26, r0
  XOR r4, r1, r28
  XOR r2, r5, r14
  SHL r2, r12, r26
  SHR r13, r2, r1
  LDI r9, 1251
  FILL r9
  CMPI r2, 255
  AND r5, r9, r0
  AND r4, r13, r15
  XOR r9, r2, r14
  OR r14, r4, r9
  FRAME
  JMP main_0
