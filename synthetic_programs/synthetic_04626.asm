; input driven program
; initialization
  LDI r14, 0x5BBD22
  LDI r9, 496
  LDI r29, 1616
  LDI r11, 0xC2A2FC
main_0:
  SHR r8, r1, r11
  SAR r10, r15, r3
  SHL r11, r7, r0
  SHL r21, r6, r1
  LDI r13, 4
  LDI r13, 0x5C4A01
  LDI r0, 256
  LDI r2, 0x00CF12
  LDI r1, 255
  LINE r13, r13, r0, r2, r1
  CMP r13, r11
  LDI r14, 0xD2CFF7
  LDI r2, 64
  LDI r15, 2870
  TEXT r14, r2, r15, "HELLO"
  LDI r8, 0
  LDI r6, 0x5260B2
  LDI r10, 0x379C47
  DRAWTEXT r8, r6, r10, "WORLD"
  FRAME
  JMP main_0
