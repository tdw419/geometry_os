; input driven program
; initialization
  LDI r14, 0xC52923
  LDI r12, 10
  LDI r10, 0x5425B9
  LDI r15, 2
  LDI r1, 3904
  LDI r3, 64
  LDI r4, 128
main_0:
  LDI r3, 4081
  LDI r0, 0xB98333
  LDI r0, 0x00872A
  DRAWTEXT r3, r0, r0, "WORLD"
  SAR r9, r7, r11
  SHLI r8, r5, 0x93013D
  SHR r11, r12, r1
  SHL r12, r10, r0
  FRAME
  JMP main_0
