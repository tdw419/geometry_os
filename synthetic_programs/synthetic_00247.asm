; input driven program
; initialization
  LDI r0, 4050
  LDI r2, 2417
main_0:
  AND r15, r0, r8
  ADD r25, r13, r8
  CMPI r9, 254
  LDI r13, 0
  LDI r30, 4
  LDI r14, 2406
  PSETI
  IKEY r0
  CMPI r0, 16
  JNZ r0, key_1
  FRAME
  JMP main_0
