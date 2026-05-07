; input driven program
; initialization
  LDI r10, 3741
  LDI r21, 2606
  LDI r9, 920
  LDI r15, 0xB367FC
  LDI r4, 0x98A106
  LDI r0, 3669
  LDI r5, 2
  LDI r2, 4
main_0:
  LDI r10, 1447
  LDI r12, 256
  LDI r1, 256
  LDI r11, 1164
  LDI r4, 0xB0D8F4
  RECTF r10, r12, r1, r11, r4
  SHR r5, r21, r12
  SAR r12, r1, r13
  SHL r13, r5, r2
  SHR r3, r11, r9
  LDI r7, 2336
  LDI r7, 64
  LDI r4, 0x17A577
  DRAWTEXT r7, r7, r4, "WORLD"
  FRAME
  JMP main_0
