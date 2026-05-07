; drawing loop program
; initialization
  LDI r9, 255
  LDI r0, 0x2DBB05
  LDI r4, 2952
  LDI r5, 244
  LDI r12, 1137
  LDI r1, 0x296DE5
  LDI r7, 32
  LDI r2, 1746
main_0:
  ADD r10, r13, r2
  IKEY r0
  CMPI r0, 1
  JNZ r0, key_1
  SHL r30, r10, r15
  SHLI r12, r3, 7
  FRAME
  JMP main_0
