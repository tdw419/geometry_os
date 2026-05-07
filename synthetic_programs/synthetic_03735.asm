; input driven program
; initialization
  LDI r5, 2728
  LDI r13, 2348
main_0:
  SAR r6, r15, r7
  SHLI r13, r3, 6
  XOR r13, r10, r15
  AND r2, r0, r5
  ADD r5, r23, r9
  IKEY r9
  CMPI r9, 0xBC21DB
  JNZ r9, key_1
  CMPI r18, 40
  LDI r4, 0xA4089F
  LDI r8, 256
  LDI r2, 16
  LDI r1, 1649
  LDI r10, 0
  LINE r4, r8, r2, r1, r10
  FRAME
  JMP main_0
