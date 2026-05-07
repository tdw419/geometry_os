; input driven program
; initialization
  LDI r3, 2562
  LDI r6, 0x41F6EF
  LDI r11, 2312
  LDI r13, 2501
  LDI r14, 0x5334D5
  LDI r0, 0xD95625
  LDI r1, 0x79B45B
main_0:
  SAR r14, r30, r7
  SHLI r15, r12, 7
  ADD r5, r13, r12
  SHR r10, r5, r6
  SHR r15, r4, r7
  SAR r4, r9, r14
  FRAME
  JMP main_0
