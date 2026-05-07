; input driven program
; initialization
  LDI r5, 4090
  LDI r9, 16
  LDI r30, 2438
  LDI r2, 1375
  LDI r10, 0x9AD9B1
  LDI r8, 1
  LDI r1, 16
main_0:
  SUB r14, r6, r2
  SHR r15, r9, r14
  IKEY r9
  CMPI r9, 2
  JNZ r9, key_1
  SHR r15, r8, r2
  SHLI r3, r14, 0xB9D9C4
  SHR r14, r3, r5
  FRAME
  JMP main_0
