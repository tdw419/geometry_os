; input driven program
; initialization
  LDI r13, 55
  LDI r29, 1315
  LDI r1, 0x18C8AC
  LDI r9, 0x8331AC
  LDI r4, 2
  LDI r15, 1
main_0:
  IKEY r13
  CMPI r13, 136
  JNZ r13, key_1
  ADD r10, r11, r14
  OR r9, r5, r11
  OR r0, r15, r12
  AND r15, r3, r12
  AND r0, r10, r6
  IKEY r13
  CMPI r13, 0
  JNZ r13, key_2
  FRAME
  JMP main_0
